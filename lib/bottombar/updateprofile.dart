import 'dart:io';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  bool _isLoading = true;
  File? _image;
  String imageBase64 = "";
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        DocumentSnapshot userData =
        await firestore.collection("users").doc(user.uid).get();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? storedImage = prefs.getString("StudentProfile");

        setState(() {
          nameController.text = userData["name"] ?? "";
          bioController.text = userData["bio"] ?? "";
          imageBase64 = storedImage ?? "";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      print("Error loading user data: $e");
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("StudentProfile", base64Image);

      setState(() {
        _image = imageFile;
        imageBase64 = base64Image;
      });
    }
  }

  Future<void> uploadProfileData() async {
    try {
      User? user = auth.currentUser;
      if (user == null) return;

      setState(() => isUpdating = true);

      await firestore.collection("users").doc(user.uid).update({
        "name": nameController.text.trim(),
        "bio": bioController.text.trim(),
      });

      setState(() => isUpdating = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile updated successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      setState(() => isUpdating = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile update failed! Try again."),
          backgroundColor: Colors.red,
        ),
      );
      print("Profile update error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: _isLoading
          ? Center(
        child: SpinKitCubeGrid(
          color: Colors.purple,
          size: 50.0,
        ),
      )
          : Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.pink, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4, 1.0],
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
                            : (imageBase64.isNotEmpty
                            ? MemoryImage(base64Decode(imageBase64))
                            : AssetImage("assets/default_avatar.png"))
                        as ImageProvider,
                        child: _image == null && imageBase64.isEmpty
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
                      SizedBox(height: 20),
                      buildTextField("Enter your Bio", bioController),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                isUpdating
                    ? SpinKitHourGlass(
                  color: Colors.white, // Adjust color
                  size: 50.0,          // Adjust size
                )
                    : ElevatedButton(
                  onPressed: uploadProfileData,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
      ),
    );
  }
}
