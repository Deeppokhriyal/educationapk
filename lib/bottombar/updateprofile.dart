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
          bioController.text = userData["bio"] ?? "";
          imageUrl = userData["profileImage"] ?? "";
        });
      }
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // print("Image picked: ${pickedFile.path}");
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      // print("No image selected.");
    }
  }

  Future<void> uploadProfileData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // print("User not logged in.");
        return;
      }

      setState(() => isLoading = true);
      String uid = user.uid;
      String newImageUrl = imageUrl;

      if (_image != null) {
        // print("Uploading image...");
        Reference ref = storage.ref().child("profileImages/$uid.jpg");
        UploadTask uploadTask = ref.putFile(_image!);

        TaskSnapshot snapshot = await uploadTask;
        newImageUrl = await snapshot.ref.getDownloadURL();
        // print("Image uploaded. URL: $newImageUrl");
      }

      await firestore.collection("users").doc(uid).update({
        "profileImage": newImageUrl,
        "name": nameController.text,
        "bio": bioController.text,
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
      // print("Error Uploading Image: $e");
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
      backgroundColor: Colors.deepPurple,
      body: Stack(
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
                      buildTextField("Enter your Bio", bioController),
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
//
// import 'dart:io';
// import 'dart:convert'; // For Base64 encoding/decoding
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // For SharedPreferences
//
// class UpdateProfilePage extends StatefulWidget {
//   @override
//   _UpdateProfilePageState createState() => _UpdateProfilePageState();
// }
//
// class _UpdateProfilePageState extends State<UpdateProfilePage> {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//
//   File? _image;
//   String? _base64Image; // Base64 encoded image string
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }
//
//   // Load user data from Firestore
//   Future<void> _loadUserData() async {
//     User? user = auth.currentUser;
//     if (user != null) {
//       DocumentSnapshot userData = await firestore.collection("users").doc(user.uid).get();
//       if (userData.exists) {
//         setState(() {
//           nameController.text = userData["name"] ?? "";
//           emailController.text = userData["email"] ?? "";
//           _base64Image = userData["profileImage"]; // Load Base64 image from Firestore
//         });
//       }
//       await _loadProfileImage(); // Load image from SharedPreferences
//     }
//   }
//
//   // Load image from SharedPreferences
//   Future<void> _loadProfileImage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _base64Image = prefs.getString("profileImage");
//     });
//   }
//
//   // Pick image from gallery and convert to Base64
//   Future<void> pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       List<int> imageBytes = await imageFile.readAsBytes();
//       String base64String = base64Encode(imageBytes); // Encode image to Base64
//
//       setState(() {
//         _image = imageFile;
//         _base64Image = base64String;
//       });
//
//       // Save Base64 image to SharedPreferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString("profileImage", base64String);
//     }
//   }
//
//   // Upload profile data to Firestore
//   Future<void> uploadProfileData() async {
//     try {
//       User? user = auth.currentUser;
//       if (user == null) {
//         print("Error: User not logged in.");
//         return;
//       }
//
//       setState(() => isLoading = true);
//
//       // Check if Firestore document exists
//       DocumentReference userDoc = firestore.collection("users").doc(user.uid);
//       DocumentSnapshot docSnapshot = await userDoc.get();
//
//       if (!docSnapshot.exists) {
//         print("Error: User document does not exist in Firestore.");
//         setState(() => isLoading = false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("User data not found in Firestore!"), backgroundColor: Colors.red),
//         );
//         return;
//       }
//
//       // Update Firestore document with new data
//       await userDoc.update({
//         "name": nameController.text,
//         "email": emailController.text,
//         "profileImage": _base64Image, // Save Base64 image string to Firestore
//       });
//
//       setState(() => isLoading = false);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Profile updated successfully!"), backgroundColor: Colors.green),
//       );
//     } catch (e) {
//       setState(() => isLoading = false);
//       print("🔥 Firestore Update Error: $e");
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Profile update failed! Try again."), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage('https://img.freepik.com/free-vector/dark-blue-blurred-background_1034-589.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 70),
//
//                 // Profile Image
//                 Center(
//                   child: Stack(
//                     children: [
//                       ClipOval(
//                         child: CircleAvatar(
//                           radius: 50,
//                           backgroundImage: _image != null
//                               ? FileImage(_image!)
//                               : (_base64Image != null
//                               ? MemoryImage(base64Decode(_base64Image!)) // Decode Base64
//                               : AssetImage("assets/default_avatar.png") as ImageProvider),
//                           child: _image == null && _base64Image == null
//                               ? Icon(Icons.person, size: 50, color: Colors.black)
//                               : null,
//                         ),
//                       ),
//                       // Edit Icon
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: GestureDetector(
//                           onTap: pickImage,
//                           child: Container(
//                             width: 32,
//                             height: 32,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.yellow[700],
//                               border: Border.all(color: Colors.white, width: 2),
//                             ),
//                             child: Icon(LineAwesomeIcons.pencil_alt_solid, size: 18, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 50),
//
//                 // Text Fields
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       buildTextField("Enter New Username", nameController),
//                       SizedBox(height: 20),
//                       buildTextField("Enter Your New Email", emailController),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 60),
//
//                 // Update Button
//                 isLoading
//                     ? CircularProgressIndicator()
//                     : ElevatedButton(
//                   onPressed: uploadProfileData,
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
//                     backgroundColor: Colors.amber[700],
//                   ),
//                   child: Text("Update", style: TextStyle(fontSize: 20, color: Colors.black)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Custom Text Field
//   Widget buildTextField(String label, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       style: TextStyle(fontSize: 20, color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.white),
//         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellowAccent)),
//         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//       ),
//     );
//   }
// }