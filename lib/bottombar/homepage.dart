import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/allpage.dart';
import 'package:educationapk/allpages/AttendancePage/attendance.dart';
import 'package:educationapk/allpages/programmingpage.dart';
import 'package:educationapk/allpages/studentAssignment.dart';
import 'package:educationapk/bottombar/globalchat.dart';
import 'package:educationapk/bottombar/profilepage.dart';
import 'package:educationapk/bottombar/updateprofile.dart';
import 'package:educationapk/homepagewidgets/collegeinfo.dart';
import 'package:educationapk/homepagewidgets/devpage.dart';
import 'package:educationapk/allpages/map.dart';
import 'package:educationapk/homepagewidgets/eventpage.dart';
import 'package:educationapk/homepagewidgets/teacherdetails.dart';
import 'package:educationapk/popupmenu/privacypolicies.dart';
import 'package:educationapk/popupmenu/termscondition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../allpages/Study/branches.dart';

class MyMainHome extends StatefulWidget {
  @override
  State<MyMainHome> createState() => _MyMainHomeState();
}

class _MyMainHomeState extends State<MyMainHome> {
  List<String> listName = [
    "All",
    "Study",
    "Programming",
    "Attendance",
    "Assignments",
    "Map",
    "Hostel",
    "Terms and Conditions",
    "Privacy Policies",
    "Ask Help Desk ",
    "Bug Report",
    "Edit Profile",
  ];

  List<String> Name = [
    "All",
    "Study",
    "Programming",
    "Attendance",
    "Assignments",
    "Map",
    "Hostel",
  ];

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String userName = "";
  String StudentProfile = "";
  String userBio = "";
  String userBranch = "";

  TextEditingController searchController = TextEditingController();
  List<String> filteredList = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    getStudentProfile();
    fetchUserData();
    filteredList = List.from(listName);
  }

  void getStudentProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedImage = prefs.getString('StudentProfile');

    if (storedImage != null && storedImage.isNotEmpty) {
      setState(() {
        StudentProfile = storedImage;

      });
    }
  }

  void fetchUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
      await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          userName = userData["name"];
          userBio = userData["bio"];
          userBranch = userData["branch"];
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('StudentProfile', StudentProfile);

      }
    }
  }

  void _filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredList = List.from(listName);
        isSearching = false;
      } else {
        filteredList = listName
            .where((name) => name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        isSearching = true;
      }
    });
  }

  void _navigateToPage(String name) {
    if (name == "All") {
      Get.to(() => MainScrollPage());
    } else if (name == "Attendance") {
      Get.to(() => AttendanceHistory());
    } else if (name == "Branches") {
      Get.to(() => MainScrollPage());
    } else if (name == "Study") {
      Get.to(() => Branches());
    } else if (name == "Programming") {
      Get.to(() => Programmingpage());
    } else if (name == "Map") {
      Get.to(() => MyMap());
    } else if (name == "Hostel") {
      Get.to(() => MyMap());
    } else if (name == "Terms and Conditions") {
      Get.to(() => Termscondition());
    } else if (name == "Privacy Policies") {
      Get.to(() => Privacypolicies());
    } else if (name == "Ask Help Desk") {
      Get.to(() => AskHelpDesk());
    } else if (name == "Bug Report") {
      Get.to(() => BugReport());
    } else if (name == "Edit Profile") {
      Get.to(() => UpdateProfilePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeIn(
        duration: Duration(milliseconds: 400),
        child: ListView(children: [
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey.shade100], // Three colors
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    stops: [0.4, 1.0]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.lightBlueAccent.shade100
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child:
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child:
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent, // Remove backgroundAsdx color

                                        backgroundImage: StudentProfile.isNotEmpty
                                            ? (StudentProfile.startsWith("http")
                                            ? NetworkImage(StudentProfile)
                                        as ImageProvider
                                            : MemoryImage(base64Decode(
                                            StudentProfile))
                                        as ImageProvider)
                                            : AssetImage(
                                            'assets/images/profile.png')
                                        as ImageProvider,
                                        onBackgroundImageError: (_, __) =>
                                            setState(() => StudentProfile = ''),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        userName.isNotEmpty ? userName : "name",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'nexaheavy'),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        userBio.isNotEmpty ? userBio : "bio",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'nexalight'),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        userBranch.isNotEmpty
                                            ? userBranch
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
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 13, top: 20),
                          child:
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent, // Remove background color
                            backgroundImage: StudentProfile.isNotEmpty
                                ? (StudentProfile.startsWith("http")
                                ? NetworkImage(StudentProfile)
                            as ImageProvider
                                : MemoryImage(base64Decode(
                                StudentProfile))
                            as ImageProvider)
                                : AssetImage(
                                'assets/images/profile.png')
                            as ImageProvider,
                            onBackgroundImageError: (_, __) =>
                                setState(() => StudentProfile = ''),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 23,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top:20),
                            child: Text(
                              'Hii Dear,',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'nexaheavy',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            userName.isNotEmpty ? userName : "user",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'nexalight',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 117, top: 20),
                        child: PopupMenuButton<String>(
                          onSelected: (String value) {
                            // Handle menu item selection
                            // print('Selected: $value');
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                onTap: () {
                                  Get.to(() => Termscondition());
                                },
                                child: Text('Terms and \nCondition\'s',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'sans-serif-light')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  Get.to(() => Privacypolicies());
                                },
                                child: Text('Privacy  Policies',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'sans-serif-light')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  Get.to(() => AskHelpDesk());
                                },
                                child: Text('Ask Help Desk',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'sans-serif-light')),
                              ),
                            ];
                          },
                          icon: Icon(Icons.menu,
                              size: 30, color: Colors.black), // Icon to display
                          elevation: 5, // Shadow elevation
                          color: Colors.white, // Background color
                          offset: Offset(0, 45), // Positioning of the menu
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      TextField(
                        controller: searchController,
                        onChanged: _filterSearch,
                        style: TextStyle(
                            fontFamily: 'sans-serif-light',
                            height: 1.2,
                            color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          suffixIcon:
                          Icon(Icons.search, size: 30, color: Colors.black),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                      ),

                      // 🔹 Dropdown List for Search Results
                      if (isSearching)
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ListView.builder(
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  filteredList[index],
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'nexalight'),
                                ),
                                onTap: () {
                                  _navigateToPage(filteredList[index]);
                                  searchController.clear(); // Search reset
                                  setState(() {
                                    isSearching = false;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ]),
                  ),
                  Row(
                    children: [
                      Text(
                        "Let's Explore\n        The Polyverse",
                        style: TextStyle(
                            fontSize: 42,
                            fontFamily: 'sans-serif-thin',
                            color: Colors.black),textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),

                  SizedBox(
                    height: 83,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: Name.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (Name[index] == "All") {
                                      Get.to(() => MainScrollPage());
                                    }
                                    if (Name[index] == "Attendance") {
                                      Get.to(() => AttendanceHistory());
                                    }
                                    if (Name[index] == "Assignments") {
                                      Get.to(() => StudentAssignment());
                                    }
                                    if (Name[index] == "Study") {
                                      Get.to(() => Branches());
                                    }
                                    if (Name[index] == "Programming") {
                                      Get.to(() => Programmingpage());
                                    }
                                    if (Name[index] == "Map") {
                                      Get.to(() => MyMap());
                                    }
                                    if (Name[index] == "Hostels") {
                                      Get.to(() => MyMap());
                                    }
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 40,
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.black26, width: 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.deepPurple.shade800,
                                          blurRadius: 7,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        Name[index],
                                        style: TextStyle(
                                            fontFamily: 'nexalight',
                                            fontSize: 15),
                                        textAlign: TextAlign
                                            .center, // Center align the text
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 15),
                          height: 200,
                          width: 190,
                          decoration: BoxDecoration(
                            color: Color(0xFF00BFA6),
                            // color: Colors.purple[200], // Background color
                            // color: Color(0xCCCCCCFF), // Background color
                            borderRadius:
                            BorderRadius.circular(25), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF00BFA6), // Shadow Color
                                spreadRadius: 2, // Spread (Kitna failaaye)
                                blurRadius: 6.5, // Blur (Kitna soft ho)
                                offset:
                                Offset(0, 5), // Shadow ka direction (X, Y)
                              ),
                            ],
                          ),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Devpage()));
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timelapse_rounded,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                        width: 105,
                                      ),
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
                                            'App',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Designing',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '106 Days',
                                        style: TextStyle(
                                            fontFamily: 'sans-serif-thin'),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Container(
                                        height: 18,
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        '2 Developer\'s',
                                        style: TextStyle(
                                            fontFamily: 'sans-serif-thin'),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Teacherdetails());
                          },
                          child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(15),
                              height: 200,
                              width: 155,
                              decoration: BoxDecoration(
                                // color: Color(0xFFFFC107),
                                // color: Colors.greenAccent, // Background color
                                color: Color(0xFFFFAB91), // Background color
                                borderRadius: BorderRadius.circular(
                                    25), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFFAB91), // Shadow Color
                                    spreadRadius: 2, // Spread (Kitna failaaye)
                                    blurRadius: 6.5, // Blur (Kitna soft ho)
                                    offset: Offset(
                                        0, 5), // Shadow ka direction (X, Y)
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person_pin_rounded,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                        width: 70,
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined,
                                          size: 28, color: Colors.black),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Teachers',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: 'sans-serif-light',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '68 Members',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'sans-serif-light',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [],
                                  )
                                ],
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 15),
                          height: 200,
                          width: 190,
                          decoration: BoxDecoration(
                            color: Colors
                                .lightBlueAccent.shade400, // Background color
                            // color: Colors.blueAccent[200], // Background color
                            borderRadius: BorderRadius.circular(25),
                            // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors
                                    .lightBlueAccent.shade400, // Shadow Color
                                spreadRadius: 2, // Spread (Kitna failaaye)
                                blurRadius: 6.5, // Blur (Kitna soft ho)
                                offset:
                                Offset(0, 5), // Shadow ka direction (X, Y)
                              ),
                            ],
                          ),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EventPage()));
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.event,
                                          size: 30, color: Colors.black),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.25,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventPage()));
                                        },
                                        child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 28,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Events',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Information',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Events info',
                                        style: TextStyle(
                                            fontFamily: 'sans-serif-thin'),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text(
                                        'Holiday\'s',
                                        style: TextStyle(
                                            fontFamily: 'sans-serif-thin'),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),

                  //blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      height: 190,
                      width: 385,
                      decoration: BoxDecoration(
                        color: Color(0xFFCE93D8), // Background color
                        // color: Color(0xfffebee3), // Background color
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFCE93D8), // Shadow Color
                            spreadRadius: 2, // Spread (Kitna failaaye)
                            blurRadius: 6.5, // Blur (Kitna soft ho)
                            offset: Offset(0, 5), // Shadow ka direction (X, Y)
                          ),
                        ], // Rounded corners
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Collegeinfo()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/clgbglogo.png',
                                  height: 65,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Government',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-light',
                                          fontSize: 22),
                                    ),
                                    Text(
                                      'Polytechnic Kashipur',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-light',
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.016,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Collegeinfo()));
                                    },
                                    child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 30,
                                        color: Colors.black)),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '9 Branches',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-thin',
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Engineering',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-light',
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'Pharmacy',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-light',
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                    child: Container(
                                      height: 70,
                                      width: 2,
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hostels',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-thin',
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Boys',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-light',
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'Girls',
                                      style: TextStyle(
                                          fontFamily: 'sans-serif-light',
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Divider(
                        height: 20,
                        color: Colors.black,
                      )),
                  Text(
                    '  Gallery',
                    style: TextStyle(
                        fontSize: 29,
                        fontFamily: 'nexaheavy',
                        color: Colors.black),
                  ),
                  Text(
                    '   Govt. Polytechnic Kashipur',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'nexaheavy',
                        color: Colors.blue),
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
                              child: Image.asset(
                                'assets/images/clg7.jpg',
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
                              child: Image.asset(
                                'assets/images/clg6.jpg',
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
                              child: Image.asset(
                                'assets/images/clg3.jpg',
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
                              child: Image.asset(
                                'assets/images/clg4.jpg',
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
                              child: Image.asset(
                                'assets/images/clg5.jpg',
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
                              child: Image.asset(
                                'assets/images/clg1.jpg',
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
                              child: Image.asset(
                                'assets/images/clg2.jpg',
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
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(),
                        color: Colors.blueAccent,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '©2025 All Rights Reserved by Teamcelestial',
                        style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white),
                      ))
                ],
              ),
            ),
          ]),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: Icon(Icons.mark_unread_chat_alt_outlined,color: Colors.lightBlueAccent,size: 35,),
        backgroundColor: Colors.white,
        shape: OvalBorder(),

      ),

    );
  }
}