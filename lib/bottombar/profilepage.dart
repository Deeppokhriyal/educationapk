import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/bottombar/updateprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name = "Loading...";
  String profileImage = "";
  String email = "";
  String phone = "";
  String github = "";
  String instagram = "";
  String location = "";

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
          email = userData["email"];
          phone = userData["phone"];
          github = userData["github"];
          instagram = userData["instagram"];
          location = userData["location"];
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
                    if (field == "email") email = controller.text;
                    if (field == "phone") phone = controller.text;
                    if (field == "github") github = controller.text;
                    if (field == "instagram") instagram = controller.text;
                    if (field == "location") location = controller.text;
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
                      image: AssetImage('assets/images/profiledee.avif'),
                      // image: NetworkImage(
                      //     'https://img.freepik.com/free-photo/abstract-gradient-neon-lights_23-2149279124.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_authors_boost'), // Path to your background image
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
                                              UpdateProfilePage()),
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
                                        title: "Email",
                                        icon: Icons.mail,
                                        value: email,
                                        onPress: () =>
                                            showEditDialog("Email", "email", email)),
                                    ProfileMenuWidget(
                                        title: "Phone",
                                        icon: Icons.phone,
                                        value: phone,
                                        onPress: () =>
                                            showEditDialog("Phone", "phone", phone)),
                                    ProfileMenuWidget(
                                        title: "GitHub",
                                        icon: LineAwesomeIcons.github,
                                        value: github,
                                        onPress: () => showEditDialog(
                                            "GitHub", "github", github)),
                                    ProfileMenuWidget(
                                        title: "Instagram",
                                        icon: LineAwesomeIcons.instagram,
                                        value: instagram,
                                        onPress: () => showEditDialog(
                                            "Instagram", "instagram", instagram)),
                                    ProfileMenuWidget(
                                        title: "Location",
                                        icon: Icons.location_city,
                                        value: location,
                                        onPress: () => showEditDialog(
                                            "Location", "location", location)),
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
                                                Get.offAll(() => MyLogin()); // Navigate to MyLogin() and remove all previous routes
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
