import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/bottombar/updateprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Teacherprofile extends StatefulWidget {
  @override
  State<Teacherprofile> createState() => _TeacherprofileState();
}

class _TeacherprofileState extends State<Teacherprofile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name = "";

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
          // email = userData["email"];
          // phone = userData["phone"];
          // github = userData["github"];
          // instagram = userData["instagram"];
          // location = userData["location"];
          // profileImage = userData["profileImage"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/pink-neon-synthwave-patterned-social-story-template-vector_53876-176441.jpg'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 25),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                LineAwesomeIcons.angle_left_solid,
                                size: 30,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                fontFamily: 'sans-serif-light',
                                letterSpacing: 0.2,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 140, top: 100),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                          // profileImage.isNotEmpty
                          //     ? NetworkImage(profileImage)
                          //     :
                          AssetImage('assets/images/profile.png')
                          as ImageProvider,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 150,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.yellow[700],
                        ),
                        child: Icon(LineAwesomeIcons.pencil_alt_solid,
                            size: 18, color: Colors.black),
                      ),
                    )
                  ]),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'sans-serif-light',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  // SizedBox(height: 10,),
                  // Text('Information Technology',style: TextStyle(fontFamily: 'sans-serif-thin',color: Colors.white),),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProfilePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            side: BorderSide.none,
                            shape: StadiumBorder()),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'sans-serif-light',
                              fontSize: 16),
                        ),
                      )),
                  SizedBox(height: 30),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Personal Information',style: TextStyle(fontFamily: 'nexaheavy',color: Colors.white,fontSize: 25),),
                      SizedBox(width: 10,),
                      Icon(LineAwesomeIcons.pencil_alt_solid,
                          size: 30, color: Colors.blue),

                    ],
                  ),

                  ProfileMenuWidget(
                    title: "Email",
                    textColor: Colors.white,
                    icon: Icons.mail,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "Phone",
                    textColor: Colors.white,
                    icon: Icons.phone_android_sharp,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "Github id",
                    textColor: Colors.white,
                    icon: LineAwesomeIcons.github,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "Instagram id",
                    textColor: Colors.white,
                    icon: LineAwesomeIcons.instagram,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "location",
                    textColor: Colors.white,
                    icon: Icons.location_city_outlined,
                    onPress: () {},
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Utilities  -',style: TextStyle(fontFamily: 'nexaheavy',color: Colors.white,fontSize: 25),),

                    ],
                  ),
                  SizedBox(height: 15,),
                  ProfileMenuWidget(
                    title: "Bug Report",
                    textColor: Colors.white,
                    icon: LineAwesomeIcons.user_check_solid,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "Settings",
                    textColor: Colors.white,
                    icon: LineAwesomeIcons.cog_solid,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "Ask Help Desk",
                    textColor: Colors.white,
                    icon: LineAwesomeIcons.info_solid,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "Logout",
                    icon: LineAwesomeIcons.sign_out_alt_solid,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                      Get.offAll(() => MyLogin());
                    },
                  ),
                ],
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    this.fontFamily = 'sans-serif-light',
  });
  final String title;
  final IconData icon;
  final Callback onPress;
  final bool endIcon;
  final Color? textColor;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.pink : Colors.lightBlueAccent[100];

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueGrey[50],
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontFamily: 'sans-serif-light')
            .apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueGrey[50],
        ),
        child: Icon(LineAwesomeIcons.angle_right_solid,
            size: 18.0, color: Colors.pink),
      )
          : null,
    );
  }
}
