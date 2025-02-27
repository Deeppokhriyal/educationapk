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

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  /// 🔹 Load Existing User Data
  Future<void> _loadUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
      await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          nameController.text = userData['name'] ?? "";
          bioController.text = userData['bio'] ?? "";
          branchController.text = userData['branch'] ?? "";
          imageUrl = userData['profileImage'] ?? ""; // Load Existing Image
        });
      }
    }
  }

  /// 🔹 Pick Image from Gallery
  Future<void> pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// 🔹 Upload Image to Firebase Storage & Update Firestore
  Future<void> updateProfile() async {
    User? user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      String? newImageUrl = imageUrl; // Default to existing image

      // ✅ If new image is selected, upload it
      if (_image != null) {
        try {
          Reference ref = storage.ref().child("profileImages/$uid.jpg");
          UploadTask uploadTask = ref.putFile(_image!);

          // Wait for image upload to complete
          TaskSnapshot snapshot = await uploadTask;
          newImageUrl = await snapshot.ref.getDownloadURL();

          // ✅ Debugging: Print Image URL
          print("New Image URL: $newImageUrl");
        } catch (e) {
          print("Image upload failed: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Image upload failed! Try again.",style: TextStyle(fontFamily: 'nexaheavy'),)),
          );
          return;
        }
      }

      // ✅ Update Firestore with new image URL
      await firestore.collection("users").doc(uid).update({
        "name": nameController.text,
        "bio": bioController.text,
        "branch": branchController.text,
        "profileImage": newImageUrl,
      });

      // ✅ Refresh UI with new data
      setState(() {
        imageUrl = newImageUrl!; // Update image URL in UI
        _image = null; // Clear selected image
      });

      // ✅ Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile Updated Successfully!",style: TextStyle(fontFamily: 'nexaheavy'),)),
      );

      // ✅ Optional: Go back after update
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/dark-blue-blurred-background_1034-589.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
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
                            ? FileImage(_image!) // If new image is selected
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
                        style: TextStyle(
                          fontFamily: 'nexaheavy',  // ✅ Input text ka font change hoga
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: "Enter New Username",
                          labelStyle: TextStyle(
                            fontFamily: 'nexalight',
                            color: Colors.white,
                          ),
                        ),
                      ),

                      TextField(
                        controller: bioController,
                        style: TextStyle(
                          fontFamily: 'nexaheavy',  // ✅ Input text ka font change hoga
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: "Enter your Bio",
                          labelStyle: TextStyle(
                            fontFamily: 'nexalight',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextField(
                        controller: branchController,
                        style: TextStyle(
                          fontFamily: 'nexaheavy',  // ✅ Input text ka font change hoga
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: "Enter your Branch",
                          labelStyle: TextStyle(
                            fontFamily: 'nexalight',
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: updateProfile,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontFamily: 'nexaheavy',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
