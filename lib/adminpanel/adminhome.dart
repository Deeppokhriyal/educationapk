import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/adminpanel/homepagewidgets/Dashboard.dart';
import 'package:educationapk/adminpanel/homepagewidgets/applicationshow.dart';
import 'package:educationapk/adminpanel/homepagewidgets/assignmentshow.dart';
import 'package:educationapk/adminpanel/homepagewidgets/attendanceshow.dart';
import 'package:educationapk/adminpanel/homepagewidgets/bugreportshow.dart';
import 'package:educationapk/adminpanel/homepagewidgets/chatboxshow.dart';
import 'package:educationapk/adminpanel/homepagewidgets/helpdeskshow.dart';
import 'package:educationapk/adminpanel/homepagewidgets/management.dart';
import 'package:educationapk/adminpanel/homepagewidgets/reportanalytics.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;



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
        });
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
      ),
      debugShowCheckedModeBanner: false,
      title: 'home page',
    );
  }
}

class TeacherMain extends StatefulWidget {


  TeacherMain({
    Key? key,
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
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Admin Dashboard" , style: TextStyle(
          fontFamily: 'nexaheavy',
          fontSize: 25
        ),),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Drawer Open Karega
            },
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: FadeIn(
        duration: Duration(milliseconds: 400),
        child: ListView( children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white24,
                    Colors.blueGrey,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              " Let's Explore\n      The Polyverse",
                              style: TextStyle(
                                  fontSize: 44,
                                  fontFamily: 'sans-serif-thin',
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
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(15),
                          height: 165,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen[100], // Background color
                            borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.lightGreenAccent, // Shadow color
                                blurRadius: 15, // Shadow blur radius
                                offset: Offset(0, 2), // Shadow offset
                              ),
                            ],
                          ),
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => UserDashboard());
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
                                              0.68),
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
                                            'Dashboard',
                                            style: TextStyle(
                                                fontSize: 35,
                                                fontFamily: 'nexalight',
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
                                    'Total Students, Teacher\'s, staff',
                                    style: TextStyle(
                                        fontFamily: 'sans-serif-thin',
                                        fontSize: 15),
                                  ),
                                ],
                              )),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => AdminUserManagementPage());
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height: 165,
                                width: MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue[100], // Background color
                                  borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.lightBlueAccent, // Shadow color
                                      blurRadius: 15, // Shadow blur radius
                                      offset: Offset(0, 2), // Shadow offset
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.manage_accounts_outlined,
                                            size: 50, color: Colors.black),
                                        // SizedBox(
                                        //     width: MediaQuery.of(context)
                                        //         .size
                                        //         .width *
                                        //         0.5),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Management',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'nexaheavy',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Assign User\'s',
                                      style: TextStyle(
                                          fontFamily: 'nexalight',
                                          fontSize: 15,
                                      color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => AdminAttendancePage());
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveApplicationsList() ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height: 165,
                                width: MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue[100], // Background color
                                  borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.lightBlueAccent, // Shadow color
                                      blurRadius: 15, // Shadow blur radius
                                      offset: Offset(0, 2), // Shadow offset
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.book_outlined,
                                            size: 50, color: Colors.black),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Attendance',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'nexaheavy',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Generate Report',
                                      style: TextStyle(
                                          fontFamily: 'nexalight',
                                          fontSize: 15,
                                      color: Colors.black),
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
                              onTap: () {
                                Get.to(() => AdminApplicationsPage());
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height: 165,
                                width: MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  color: Colors.pink[100], // Background color
                                  borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pinkAccent, // Shadow color
                                      blurRadius: 15, // Shadow blur radius
                                      offset: Offset(0, 2), // Shadow offset
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.note_alt_outlined,
                                            size: 50, color: Colors.black),
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
                                                  fontFamily: 'nexaheavy',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Manage Application\'s',
                                              style: TextStyle(
                                                  fontFamily: 'nexalight',
                                                  fontSize: 15,
                                              color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
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
                                color: Colors.pink[100], // Background color
                                borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent, // Shadow color
                                    blurRadius: 15, // Shadow blur radius
                                    offset: Offset(0, 2), // Shadow offset
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => AdminAssignmentPage());
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
                                                'Assignment\'s',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'nexalight',
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
                                        'Modify/Delete',
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
                                color: Colors.yellowAccent[100], // Background color
                                borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.yellow, // Shadow color
                                    blurRadius: 15, // Shadow blur radius
                                    offset: Offset(0, 2), // Shadow offset
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
                                              'Announcement',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'nexalight',
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
                                      'Send Important '
                                          'Announcement\'s',
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
                                color: Colors.yellowAccent[100], // Background color
                                borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.yellow, // Shadow color
                                    blurRadius: 15, // Shadow blur radius
                                    offset: Offset(0, 2), // Shadow offset
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => AdminHelpDeskPage());
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
                                                'Help Desk',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'nexalight',
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
                                        'Answer Quesrie\'s',
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
                                color: Colors.green[100], // Background color
                                borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightGreen, // Shadow color
                                    blurRadius: 15, // Shadow blur radius
                                    offset: Offset(0, 2), // Shadow offset
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => AdminBugReportsPage());
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
                                              'Bug\'s & Report',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'nexalight',
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
                                          'Fixes Bugs',
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
                                color: Colors.green[100], // Background color
                                borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightGreen, // Shadow color
                                    blurRadius: 15, // Shadow blur radius
                                    offset: Offset(0, 2), // Shadow offset
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => AdminPolyChatPage());
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
                                                'Chat Box',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'nexalight',
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
                                        'Manage Chat\'s',
                                        style: TextStyle(
                                            fontFamily: 'sans-serif-thin',
                                            fontSize: 12),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(15),
                          height: 165,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100], // Background color
                            borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.lightBlue, // Shadow color
                                blurRadius: 15, // Shadow blur radius
                                offset: Offset(0, 2), // Shadow offset
                              ),
                            ],
                          ),
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => ReportsAnalyticsPage());
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
                                              0.69),
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
                                            'Report & analytic\'s',
                                            style: TextStyle(
                                                fontSize: 33,
                                                fontFamily: 'nexalight',
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
                                    'Chart / branch\'s',
                                    style: TextStyle(
                                        fontFamily: 'sans-serif-thin',
                                        fontSize: 15),
                                  ),
                                ],
                              )),
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
                          color: Colors.white),
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
                  ],
                ),
              ),
            ),
          ]),
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
                    seconds:
                    1), // Ek baar complete hone ke baad pause
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(seconds: 1),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          )
          ,

        ]),
      ),
    );
  }
}
