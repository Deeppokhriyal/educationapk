import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/teacherpanel/bottombar/updateTeacherprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../main.dart';


class Teacherprofile extends StatefulWidget {
  @override
  State<Teacherprofile> createState() => _TeacherprofileState();
}

class _TeacherprofileState extends State<Teacherprofile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name = "Loading...";
  String profileImage = "";
  String qualification = "";
  String previousrole = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
      await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          name = userData["name"];
          qualification = userData["qualification"];
          previousrole = userData["previousrole"];
          profileImage = userData["profileImage"] ?? "";
        });
      }
    }
  }

  void showEditDialog(String title, String field, String currentValue) {
    TextEditingController controller =
    TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.purple[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // Border Radius 55
          ),
          title: Text("Edit $title",style: TextStyle(fontFamily: 'nexaheavy'),),
          content: TextField(controller: controller,style: TextStyle(fontFamily: 'nexalight'),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel",style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.black),),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = auth.currentUser;
                if (user != null) {
                  await firestore.collection("users").doc(user.uid).update({
                    field: controller.text,
                  });
                  setState(() {
                    if (field == "qualification") qualification = controller.text;
                    if (field == "previousrole") previousrole = controller.text;
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Save",style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.black),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/abstract-gradient-neon-lights_23-2149279124.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_authors_boost'), // Path to your background image
                      // image: NetworkImage('https://img.freepik.com/premium-photo/tiles-art-illustration_732004-8.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'),// Path to your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SlideInUp(
                    duration: Duration(milliseconds: 400),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: profileImage.isNotEmpty
                                          ? NetworkImage(profileImage)
                                          : AssetImage(
                                          'assets/images/profile.png')
                                      as ImageProvider,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 23,fontFamily: 'nexalight')),
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
                                  child: Text("Edit Profile",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 16,color: Colors.black),),
                                ),
                                Divider(color: Colors.grey, height: 35),
                                SlideInLeft(
                                  duration: Duration(milliseconds: 300),
                                  child: Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontFamily: 'nexaheavy',
                                        color: Colors.white,
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
                                            onPress: () =>
                                                showEditDialog("Qualification", "qualification", qualification)),
                                        ProfileMenuWidget(
                                            title: "Previous Role",
                                            icon: Icons.phone,
                                            value: previousrole,
                                            onPress: () =>
                                                showEditDialog("Previous Role", "previousrole", previousrole)),
                                      ],
                                    )),
                                Divider(color: Colors.grey, height: 35),
                                SlideInLeft(
                                  duration: Duration(milliseconds: 400),
                                  child: Text(
                                    'Utilities',
                                    style: TextStyle(
                                        fontFamily: 'nexaheavy',
                                        color: Colors.white,
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
                                            child: Row(
                                              children: [
                                                Icon(LineAwesomeIcons.user_check_solid,color: Colors.pink,size: 27,),
                                                SizedBox(width: 15,),
                                                Text('Bug Report',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          GestureDetector(
                                            child: Row(
                                              children: [
                                                Icon(LineAwesomeIcons.info_solid,color: Colors.pink,size: 27,),
                                                SizedBox(width: 15,),
                                                Text('Ask Help Desk',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height:30,),
                                          GestureDetector(
                                              onTap: () {
                                                logout();
                                                // Get.offAll(() => MyLogin()); // Navigate to MyLogin() and remove all previous routes
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.logout,color: Colors.pink,size: 27,),
                                                  SizedBox(width: 15,),
                                                  Text('Logout',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 17,color: Colors.white),),
                                                ],
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )),
            ],
          ),
        ],
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
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Icon(icon, color: Colors.pink,size: 27,),
      title: Text(title,
          style: TextStyle(color: textColor, fontFamily: 'nexaheavy',fontSize: 17)),
      subtitle: Text(value, style: TextStyle(color: Colors.grey, fontFamily: 'nexalight',fontSize: 15)),
      trailing: Icon(Icons.edit, color: Colors.white),
    );
  }
}
