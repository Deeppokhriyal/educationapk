import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/bottombar/profilepage.dart';
import 'package:educationapk/homepagewidgets/devpage.dart';
import 'package:educationapk/popupmenu/privacypolicies.dart';
import 'package:educationapk/popupmenu/termscondition.dart';
import 'package:educationapk/teacherpanel/allbox/applications.dart';
import 'package:educationapk/teacherpanel/allbox/assignments.dart';
import 'package:educationapk/teacherpanel/allbox/attendance.dart';
import 'package:educationapk/teacherpanel/allbox/students%20profile.dart';
import 'package:educationapk/teacherpanel/allbox/studentview.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/teacherdev.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../homepagewidgets/teacherdetails.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String teacherName = "";
  String profileImage = "";
  String teacherPost = "";
  String teacherBranch = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
    getProfileImage();
  }

  void getProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      profileImage = prefs.getString('profileImage') ?? "";
    });
  }

  void fetchUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          teacherName = userData["name"];
          profileImage = userData["profileImage"];
          teacherPost = userData["post"];
          teacherBranch = userData["branch"];
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('profileImage', profileImage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeacherMain(
        teacherName: teacherName,
        profileImage: profileImage,
        teacherPost: teacherPost,
        teacherBranch: teacherBranch,
      ),
      debugShowCheckedModeBanner: false,
      title: 'home page',
    );
  }
}

class TeacherMain extends StatefulWidget {

  final String teacherName;
  final String teacherPost;
  final String teacherBranch;
  String profileImage;

  TeacherMain({
    Key? key,
    required this.teacherName,
    required this.teacherPost,
    required this.teacherBranch,
    required this.profileImage,
  }) : super(key: key);

  @override
  State<TeacherMain> createState() => _TeacherMainState();
}

class _TeacherMainState extends State<TeacherMain> {

  final String url = "https://celestial-deepak.vercel.app/";

  void _launchURL() async {
    final Uri uri = Uri.parse("https://celestial-deepak.vercel.app/");

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeIn(
        duration: Duration(milliseconds: 400),
        child: ListView(padding: EdgeInsets.all(4), children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.orange.shade100,
                //     Colors.blueGrey,
                //     Colors.lightBlueAccent.shade100
                //   ],
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.orange.shade50,
                                      Colors.lightBlueAccent.shade100
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor:
                                          Colors.transparent,  // Default background
                                      backgroundImage: widget
                                              .profileImage.isNotEmpty
                                          ? (widget.profileImage
                                                  .startsWith("http")
                                              ? NetworkImage(widget.profileImage)
                                                  as ImageProvider
                                              : MemoryImage(base64Decode(
                                                      widget.profileImage))
                                                  as ImageProvider)
                                          : AssetImage(
                                                  'assets/images/profile.png')
                                              as ImageProvider,
                                      onBackgroundImageError: (_, __) => setState(
                                          () => widget.profileImage = ''),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      widget.teacherName.isNotEmpty
                                          ? widget.teacherName
                                          : "name",
                                      style: TextStyle(
                                          fontSize: 17, fontFamily: 'nexaheavy'),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      widget.teacherPost.isNotEmpty
                                          ? widget.teacherPost
                                          : "post",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'nexalight'),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      widget.teacherBranch.isNotEmpty
                                          ? widget.teacherBranch
                                          : "branch",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'nexalight'),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Govt. Polytechnic Kashipur',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'nexaheavy'),
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Close',
                                            style: TextStyle(
                                                fontFamily: 'sans-serif-light',
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.only(left: 13, top: 50),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.transparent,  // Default background
                              backgroundImage: widget.profileImage.isNotEmpty
                                  ? (widget.profileImage.startsWith("http")
                                      ? NetworkImage(widget.profileImage)
                                          as ImageProvider
                                      : MemoryImage(
                                              base64Decode(widget.profileImage))
                                          as ImageProvider)
                                  : AssetImage('assets/images/profile.png')
                                      as ImageProvider,
                              onBackgroundImageError: (_, __) =>
                                  setState(() => widget.profileImage = ''),
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              'Namskaram',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'sans-serif-light',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            widget.teacherName.isNotEmpty
                                ? widget.teacherName
                                : "Teacher",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'sans-serif-light',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 120, top: 50),
                        child: PopupMenuButton<String>(
                          onSelected: (String value) {
                            // Handle menu item selection
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                onTap: () {
                                  Get.to(()=>Termscondition());

                                },
                                value: 'Profile',
                                child: Text('Terms and \nCondition\'s',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'sans-serif-light')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  Get.to(()=>Privacypolicies());

                                },
                                value: 'Settings',
                                child: Text('Privacy  Policies',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'sans-serif-light')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  Get.to(()=>BugReport());
                                },
                                value: 'Bug Reports',
                                child: Text('Bug Reports',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'sans-serif-light')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                 Get.to(()=>AskHelpDesk());
                                },
                                value: 'Ask Help Desk',
                                child: Text('Ask Help Desk',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'sans-serif-light')),
                              ),
                            ];
                          },
                          icon: Icon(Icons.menu,
                              size: 28, color: Colors.black), // Icon to display
                          elevation: 5, // Shadow elevation
                          color: Colors.grey[100], // Background color
                          offset: Offset(0, 45), // Positioning of the menu
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Let's Explore\n    The Polyverse",
                            style: TextStyle(
                                fontSize: 44,
                                fontFamily: 'nexalight',
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){Get.to(Devpage());},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: 165,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.lightGreen.shade50, Colors.lightGreen.shade400], // Three colors
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft), // Background color
                                borderRadius:
                                    BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightGreen.shade300, // Shadow color
                                    blurRadius: 5, // Shadow blur radius
                                    offset: Offset(0, 4), // Shadow offset
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timelapse_sharp,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.21),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => Teacherdev());
                                        },
                                        child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 28,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'App',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Designing',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Developed By 2 Developer\'s in 90 Days',
                                    style: TextStyle(
                                        fontFamily: 'sans-serif-thin',
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){Get.to(Teacherdetails());},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: 165,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.lightGreen.shade400, Colors.lightGreen.shade50], // Three colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),  // Background color
                                borderRadius:
                                    BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightGreen.shade300, // Shadow color
                                    blurRadius: 5, // Shadow blur radius
                                    offset: Offset(0, 4), // Shadow offset
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timelapse_sharp,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.21),
                                      Icon(Icons.arrow_forward_ios_outlined,
                                          size: 28, color: Colors.black),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Teacher\'s',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'All Registered Teacher\'s in this Page',
                                    style: TextStyle(
                                        fontFamily: 'sans-serif-thin',
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){Get.to(AttendanceScreen());},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: 165,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.lightBlue.shade50, Colors.lightBlue.shade400], // Three colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                borderRadius:
                                    BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlue.shade300, // Shadow color
                                    blurRadius: 5, // Shadow blur radius
                                    offset: Offset(0, 4), // Shadow offset
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timelapse_sharp,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.21),
                                      Icon(Icons.arrow_forward_ios_outlined,
                                          size: 28, color: Colors.black),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Attendance',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Mark the Attendance of students',
                                    style: TextStyle(
                                        fontFamily: 'sans-serif-thin',
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){Get.to(LeaveApplicationsList());},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: 165,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.lightBlue.shade400, Colors.lightBlue.shade50], // Three colors
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                borderRadius:
                                    BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlue.shade300, // Shadow color
                                    blurRadius: 5, // Shadow blur radius
                                    offset: Offset(0, 4), // Shadow offset
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timelapse_sharp,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.21),
                                      Icon(Icons.arrow_forward_ios_outlined,
                                          size: 28, color: Colors.black),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Application\'s',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Received the Application of the Students',
                                    style: TextStyle(
                                        fontFamily: 'sans-serif-thin',
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: 165,
                            width: MediaQuery.of(context).size.width * 0.43,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.red.shade50, Colors.red.shade400], // Three colors
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.shade300, // Shadow color
                                  blurRadius: 5, // Shadow blur radius
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(() => TeacherAssignmentScreen());
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.timelapse_sharp,
                                            size: 30, color: Colors.black),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.21),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 28, color: Colors.black),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Assignment\'s',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'sans-serif-light',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'you can give Assignments via this feature',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-thin',
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: 165,
                            width: MediaQuery.of(context).size.width * 0.43,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.red.shade400, Colors.red.shade50], // Three colors
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.shade300, // Shadow color
                                  blurRadius: 5, // Shadow blur radius
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(() => Studentview());
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.timelapse_sharp,
                                            size: 30, color: Colors.black),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.21),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 28, color: Colors.black),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Log in',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'sans-serif-light',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'As a Student',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'sans-serif-light',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'See Student Panel',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-thin',
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: 165,
                            width: MediaQuery.of(context).size.width * 0.43,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.yellow.shade50, Colors.yellow.shade400], // Three colors
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.shade300, // Shadow color
                                  blurRadius: 5, // Shadow blur radius
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => SyllabusPage());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timelapse_sharp,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.21),
                                      Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 28,
                                          color: Colors.black),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Syllabus',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'All Syllabus Available',
                                    style: TextStyle(
                                        fontFamily: 'sans-serif-thin',
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: 165,
                            width: MediaQuery.of(context).size.width * 0.43,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.yellow.shade400, Colors.yellow.shade50], // Three colors
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.shade300, // Shadow color
                                  blurRadius: 5, // Shadow blur radius
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(() => StudentProfilePage());
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.timelapse_sharp,
                                            size: 30, color: Colors.black),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.21),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 28, color: Colors.black),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Student',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'sans-serif-light',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Profile\'s',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'sans-serif-light',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Only your Branch Registered Student\'s',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-thin',
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Divider(
                      height: 25,
                    ),
                  ),
                  Text(
                    '  Gallery',
                    style: TextStyle(
                        fontSize: 29,
                        fontFamily: 'nexaheavy',
                        color: Colors.blue[900]),
                  ),
                  Text(
                    '   Govt. Polytechnic Kashipur',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'nexalight',
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.all(15),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://drive.google.com/uc?export=view&id=1fqQLkDo4CDfsTxdcawPoSGxEUbrFxQ9F',

                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Academic Block',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://drive.google.com/uc?export=view&id=1CBXD_TpP7qbWF3vRQnlDAcADLhsXl-TH',

                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'IT Block',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child:CachedNetworkImage(
                                imageUrl:
                                'https://drive.google.com/uc?export=view&id=1LBisNSnXZh6Ij5ATKeLHd6TpIL1aEtWE',

                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Digital Library',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://drive.google.com/uc?export=view&id=1jsXLnpawjbDlMZHipx9a2qABbAKweLgi',

                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Canteen',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://drive.google.com/uc?export=view&id=1nLRdZA__y1cA2ykHMqXUiyfK0j3lJBvi',

                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Workshop\'s',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://drive.google.com/uc?export=view&id=1yI3wtdf-Er4DXbFfWAFS6qPtDMio5Uiw',
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'NCC Block',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: CachedNetworkImage(
                                imageUrl: 'https://drive.google.com/uc?export=view&id=1RQpJ9sgu5e1qXKTzq-txoblfOtD-2KWv',
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Parking',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: _launchURL,

                    child: Container(
                      width: double.infinity,
                      height: 30,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: Marquee(
                        text:
                        "©2025 All Rights Reserved by TeamCelestial    ", // Text scroll hoga
                        style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 13,
                            color: Colors.black),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: 50.0, // Space between loops
                        velocity: 50.0, // Speed of scrolling
                        pauseAfterRound: Duration(
                            seconds: 2), // Ek baar complete hone ke baad pause
                        startPadding: 10.0,
                        accelerationDuration: Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: Duration(seconds: 1),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  )
,
                ],
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
