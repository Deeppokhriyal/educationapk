import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/bottombar/profilepage.dart';
import 'package:educationapk/teacherpanel/bottombar/updateTeacherprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class Teacherprofile extends StatefulWidget {
  @override
  State<Teacherprofile> createState() => _TeacherprofileState();
}

class _TeacherprofileState extends State<Teacherprofile> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name = "";
  String profileImage = "";
  String qualification = "";
  String previousrole = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
    getProfileImage();
  }

  void refreshProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      profileImage = prefs.getString('profileImage') ?? "";
    });
  }

  void getProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedImage = prefs.getString('profileImage');

    if (storedImage != null && storedImage.isNotEmpty) {
      setState(() {
        profileImage = storedImage;
      });
    }
  }

  void fetchUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await firestore.collection("users").doc(user.uid).get();
      print("Firestore Data: ${userData.data()}"); // Debugging ke liye

      if (userData.exists) {
        setState(() {
          name = userData["name"] ??
              ""; // Agar name missing hai to "No Name" show ho
          qualification = userData["qualification"] ?? "N/A";
          previousrole = userData["previousrole"] ?? "N/A";
          profileImage = userData["profileImage"] ?? "";
        });

        // SharedPreferences me save karna
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('profileImage', profileImage);
      } else {
        print("Document does not exist!");
      }
    } else {
      print("User not found!");
    }
  }

  void showEditDialog(String title, String field, String currentValue) {
    TextEditingController controller =
        TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return ListView(
          children:[ AlertDialog(
            backgroundColor: Colors.purple[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40), // Border Radius 55
            ),
            title: Text(
              "Edit $title",
              style: TextStyle(fontFamily: 'nexaheavy'),
            ),
            content: TextField(
              controller: controller,
              style: TextStyle(fontFamily: 'nexalight',color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontFamily: 'nexalight', fontSize: 16, color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  User? user = auth.currentUser;
                  if (user != null) {
                    await firestore.collection("users").doc(user.uid).update({
                      field: controller.text,
                    });
                    setState(() {
                      if (field == "name") name = controller.text;
                      if (field == "qualification")
                        qualification = controller.text;
                      if (field == "previousrole") previousrole = controller.text;
                    });
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontFamily: 'nexalight', fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ]
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children:[ Stack(
          alignment: Alignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: SlideInUp(
                  duration: Duration(milliseconds: 400),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor:
                                        Colors.transparent, // Default background
                                    backgroundImage: profileImage.isNotEmpty
                                        ? (profileImage.startsWith("http")
                                            ? NetworkImage(profileImage)
                                                as ImageProvider
                                            : MemoryImage(
                                                    base64Decode(profileImage))
                                                as ImageProvider)
                                        : AssetImage('assets/images/profile.png')
                                            as ImageProvider,
                                    onBackgroundImageError: (_, __) =>
                                        setState(() => profileImage = ''),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              // name.isEmpty
                              //     ? CircularProgressIndicator(color: Colors.blue)
                              //     :
                              Text(
                                name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontFamily: 'nexalight',
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateTeacherProfilePage()),
                                  );
                                },
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      fontFamily: 'nexaheavy',
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              Divider(color: Colors.grey, height: 35),
                              SlideInLeft(
                                duration: Duration(milliseconds: 300),
                                child: Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontFamily: 'nexaheavy',
                                      color: Colors.black,
                                      fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SlideInRight(
                                  duration: Duration(milliseconds: 300),
                                  child: Column(
                                    children: [
                                      ProfileMenuWidget(
                                          title: " Highest Qualification",
                                          icon: Icons.book_rounded,
                                          value: qualification,
                                          onPress: () => showEditDialog(
                                              "Qualification",
                                              "qualification",
                                              qualification)),
                                      ProfileMenuWidget(
                                          title: "Previous Role",
                                          icon: Icons.person_pin,
                                          value: previousrole,
                                          onPress: () => showEditDialog(
                                              "Previous Role",
                                              "previousrole",
                                              previousrole)),
                                    ],
                                  )),
                              Divider(color: Colors.grey, height: 35),
                              SlideInLeft(
                                duration: Duration(milliseconds: 400),
                                child: Text(
                                  'Utilities',
                                  style: TextStyle(
                                      fontFamily: 'nexaheavy',
                                      color: Colors.black,
                                      fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SlideInRight(
                                duration: Duration(milliseconds: 400),
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => BugReport());
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                LineAwesomeIcons.user_check_solid,
                                                color: Colors.blue,
                                                size: 27,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Bug Report',
                                                style: TextStyle(
                                                    fontFamily: 'nexaheavy',
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => AskHelpDesk());
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                LineAwesomeIcons.info_solid,
                                                color: Colors.blue,
                                                size: 27,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Ask Help Desk',
                                                style: TextStyle(
                                                    fontFamily: 'nexaheavy',
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              logout();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.logout,
                                                  color: Colors.blue,
                                                  size: 27,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  'Logout',
                                                  style: TextStyle(
                                                      fontFamily: 'nexaheavy',
                                                      fontSize: 17,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ))
                                      ],
                                    )),
                              ),
                            ],
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ]
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;

  ProfileMenuWidget({
    required this.title,
    required this.value,
    required this.icon,
    required this.onPress,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Icon(
        icon,
        color: Colors.blue,
        size: 27,
      ),
      title: Text(title,
          style: TextStyle(
              color: textColor, fontFamily: 'nexaheavy', fontSize: 17)),
      subtitle: Text(value,
          style: TextStyle(
              color: Colors.grey, fontFamily: 'nexalight', fontSize: 15)),
      trailing: Icon(Icons.edit, color: Colors.black),
    );
  }
}
