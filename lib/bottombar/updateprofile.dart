import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController nameController = TextEditingController();
  File? _image;
  String imageUrl = "";

  Future<void> pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> updateProfile() async {
    User? user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      String? newImageUrl;

      if (_image != null) {
        Reference ref = storage.ref().child("profileImages/$uid.jpg");
        await ref.putFile(_image!);
        newImageUrl = await ref.getDownloadURL();
      }

      await firestore.collection("users").doc(uid).update({
        "name": nameController.text,
        "profileImage": newImageUrl ?? imageUrl,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: pickImage,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: _image != null ? FileImage(_image!) : null,
            ),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Enter New Name"),
          ),
          ElevatedButton(
            onPressed: updateProfile,
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}
