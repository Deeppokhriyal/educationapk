import 'dart:io';
import 'dart:convert'; // For Base64 encoding/decoding
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart'; // For SharedPreferences

class UpdateTeacherProfilePage extends StatefulWidget {
  @override
  _UpdateTeacherProfilePageState createState() => _UpdateTeacherProfilePageState();
}

class _UpdateTeacherProfilePageState extends State<UpdateTeacherProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController postController = TextEditingController();

  File? _image;
  String? _base64Image; // Base64 encoded image string
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from Firestore
  Future<void> _loadUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          nameController.text = userData["name"] ?? "";
          emailController.text = userData["email"] ?? "";
          postController.text = userData["post"] ?? "";
          _base64Image = userData["profileImage"]; // Load Base64 image from Firestore
        });
      }
      await _loadProfileImage(); // Load image from SharedPreferences
    }
  }

  // Load image from SharedPreferences
  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _base64Image = prefs.getString("profileImage");
    });
  }

  // Pick image from gallery and convert to Base64
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64String = base64Encode(imageBytes); // Encode image to Base64

      setState(() {
        _image = imageFile;
        _base64Image = base64String;
      });

      // Save Base64 image to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("profileImage", base64String);
    }
  }

  // Upload profile data to Firestore
  Future<void> uploadProfileData() async {
    try {
      User? user = auth.currentUser;
      if (user == null) {
        print("Error: User not logged in.");
        return;
      }

      setState(() => isLoading = true);

      // Check if Firestore document exists
      DocumentReference userDoc = firestore.collection("users").doc(user.uid);
      DocumentSnapshot docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        print("Error: User document does not exist in Firestore.");
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User data not found in Firestore!"), backgroundColor: Colors.red),
        );
        return;
      }

      // Update Firestore document with new data
      await userDoc.update({
        "name": nameController.text,
        "email": emailController.text,
        "post": postController.text,
        "profileImage": _base64Image, // Save Base64 image string to Firestore
      });

      setState(() => isLoading = false);



      showAwesomeSnackBar(context, "Profile updated successfully!", true);

    } catch (e) {
      setState(() => isLoading = false);
      print("🔥 Firestore Update Error: $e");


      showAwesomeSnackBar(context, "Profile update failed! Try again.", false);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white,Colors.lightBlue],
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70),
              
                  // Profile Image
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _image != null
                                ? FileImage(_image!)
                                : (_base64Image != null
                                ? MemoryImage(base64Decode(_base64Image!)) // Decode Base64
                                : AssetImage("assets/default_avatar.png") as ImageProvider),
                            child: _image == null && _base64Image == null
                                ? Icon(Icons.person, size: 50, color: Colors.black)
                                : null,
                          ),
                        ),
                        // Edit Icon
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: pickImage,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow[700],
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: Icon(LineAwesomeIcons.pencil_alt_solid, size: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  SizedBox(height: 50),
              
                  // Text Fields
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        buildTextField("Enter New Username", nameController),
                        SizedBox(height: 20),
                        buildTextField("Enter Your New Email", emailController),
                        SizedBox(height: 20),
                        buildTextField("Enter Your Post", postController),
                      ],
                    ),
                  ),
              
                  SizedBox(height: 150),
              
                  // Update Button
                  isLoading
                      ? SpinKitHourGlass(color: Colors.white,)
                      : ElevatedButton(
                    onPressed: uploadProfileData,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                      backgroundColor: Colors.white,
                    ),
                    child: Text("Update", style: TextStyle(fontSize: 20, color: Colors.lightBlue)),
                  ),
                 ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Text Field
  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellowAccent)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}