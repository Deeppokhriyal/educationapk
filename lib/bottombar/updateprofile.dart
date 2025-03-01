import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  File? _image;
  String imageUrl = "";
  bool isLoading = false; // 🔹 For showing loading indicator

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  /// 🔹 Load Existing User Data from Firestore
  Future<void> _loadUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          nameController.text = userData['name'] ?? "";
          bioController.text = userData['bio'] ?? "";
          branchController.text = userData['branch'] ?? "";
          imageUrl = userData['profileImage'] ?? "";
        });
      }
    }
  }

  /// 🔹 Pick Image from Gallery
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// 🔹 Upload Image to Firebase Storage & Update Firestore
  Future<void> uploadImage() async {
    User? user = auth.currentUser;
    if (user != null && _image != null) {
      setState(() => isLoading = true);

      try {
        String uid = user.uid;
        Reference ref = storage.ref().child("profileImages/$uid.jpg");

        UploadTask uploadTask = ref.putFile(_image!);
        TaskSnapshot snapshot = await uploadTask;
        String newImageUrl = await snapshot.ref.getDownloadURL();

        // ✅ Update Firestore with new Image URL
        await firestore.collection("users").doc(uid).update({
          "profileImage": newImageUrl,
        });

        setState(() {
          imageUrl = newImageUrl;
          _image = null;
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile image updated successfully!")),
        );
      } catch (e) {
        setState(() => isLoading = false);
        print("Image upload failed: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image upload failed! Try again.")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No image selected!")),
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
                    'https://img.freepik.com/free-vector/dark-blue-blurred-background_1034-589.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
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
                            child: Icon(
                              LineAwesomeIcons.pencil_alt_solid,
                              size: 18,
                              color: Colors.white,
                            ),
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
                      TextField(
                        controller: nameController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter New Username",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextField(
                        controller: bioController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter your Bio",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextField(
                        controller: branchController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter your Branch",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                isLoading
                    ? CircularProgressIndicator() // 🔹 Show loading indicator while uploading
                    : ElevatedButton(
                  onPressed: uploadImage,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: Text(
                    "Update",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
