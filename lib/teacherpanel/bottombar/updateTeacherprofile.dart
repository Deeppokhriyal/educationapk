import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateTeacherProfilePage extends StatefulWidget {
  @override
  _UpdateTeacherProfilePageState createState() => _UpdateTeacherProfilePageState();
}

class _UpdateTeacherProfilePageState extends State<UpdateTeacherProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  File? _image;
  String imageUrl = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
      await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          nameController.text = userData["name"] ?? "";
          emailController.text = userData["email"] ?? "";
          imageUrl = userData["profileImage"] ?? "";
        });
      }
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadProfileData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      setState(() => isLoading = true);
      String uid = user.uid;
      String newImageUrl = imageUrl;

      if (_image != null) {
        Reference ref = storage.ref().child("profileImages/$uid.jpg");
        UploadTask uploadTask = ref.putFile(_image!);

        TaskSnapshot snapshot = await uploadTask;
        newImageUrl = await snapshot.ref.getDownloadURL();
      }

      await firestore.collection("users").doc(uid).update({
        "profileImage": newImageUrl,
        "name": nameController.text,
        "email": emailController.text,
      });

      setState(() {
        imageUrl = newImageUrl;
        _image = null;
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile updated successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      setState(() => isLoading = false);
      print("Error Uploading Image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile update failed! Try again."),
          backgroundColor: Colors.red,
        ),

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/dark-blue-blurred-background_1034-589.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : (imageUrl.isNotEmpty
                            ? NetworkImage(imageUrl) as ImageProvider
                            : AssetImage("assets/default_avatar.png")),
                        child: _image == null && imageUrl.isEmpty
                            ? Icon(Icons.person, size: 50, color: Colors.black)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow[700],
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Icon(LineAwesomeIcons.pencil_alt_solid,
                                size: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      buildTextField("Enter New Username", nameController),
                      buildTextField("Enter your new email", emailController),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: uploadProfileData,
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                  ),
                  child: Text("Update",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
