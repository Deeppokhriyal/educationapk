import 'package:cached_network_image/cached_network_image.dart';
import 'package:educationapk/allpage.dart';
import 'package:educationapk/allpages/AttendancePage/attendance.dart';
import 'package:educationapk/allpages/Study/branches.dart';
import 'package:educationapk/allpages/programmingpage.dart';
import 'package:educationapk/homepagewidgets/collegeinfo.dart';
import 'package:educationapk/homepagewidgets/devpage.dart';
import 'package:educationapk/allpages/map.dart';
import 'package:educationapk/homepagewidgets/eventpage.dart';
import 'package:educationapk/homepagewidgets/teacherdetails.dart';
import 'package:educationapk/popupmenu/privacypolicies.dart';
import 'package:educationapk/popupmenu/termscondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

import '../../allpages/E_library.dart';
import '../../allpages/studentAssignment.dart';
import '../../bottombar/profilepage.dart';
import '../../popupmenu/fetchannouncements.dart';


class Studentview extends StatefulWidget {

  @override
  State<Studentview> createState() => _StudentviewState();

}

class _StudentviewState extends State<Studentview> {
  List<String> Name=[
    "All",
    "Study",
    "Programming",
    "Attendance",
    "Branches",
    "Map",
    "E-Library",
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children:[ Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.lightBlue.shade100,  Colors.white], // Three colors
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.2,0.6,0.8]
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(width: 23,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 50),
                                child: Text('Hii,', style: TextStyle(fontSize: 16,fontFamily: 'nexaheavy',fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                              Text('you logged in as a Student,', style: TextStyle(fontSize: 15,fontFamily: 'nexaheavy',fontWeight: FontWeight.bold,color: Colors.black),),                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 80, top: 20),
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
                                            fontFamily: 'nexalight')),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      Get.to(() => Privacypolicies());
                                    },
                                    child: Text('Privacy  Policies',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'nexalight')),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      Get.to(() => BugReport());
                                    },
                                    child: Text('Bug Reports',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'nexalight')),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      Get.to(() => AskHelpDesk());
                                    },
                                    child: Text('Ask Help Desk',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'nexalight')),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      Get.to(() => AnnouncementListPage());
                                    },
                                    child: Text('Announcements',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'nexaheavy')),
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
                        ]),
                      ),
                      Row(
                        children: [
                          Text(
                            "Let's Explore\n        The Polyverse",
                            style: TextStyle(
                                fontSize: 42,
                                fontFamily: 'sans-serif-thin',
                                fontWeight: FontWeight.bold,
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
                                        if (Name[index] == "E-Library") {
                                          Get.to(() => ELibrary());
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
                                              color: Colors.lightBlue.shade800,
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
                            GestureDetector(
                              onTap: (){Get.to(Devpage());},
                              child: AnimatedContainer(duration:  Duration(milliseconds: 200),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 15),
                                height: 200,
                                width: 190,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.green.shade50, Colors.green.shade400],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(25), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color:Colors.green.shade300, // Shadow Color
                                      // spreadRadius: 2, // Spread (Kitna failaaye)
                                      blurRadius: 5, // Blur (Kitna soft ho)
                                      offset:
                                      Offset(0, 4), // Shadow ka direction (X, Y)
                                    ),
                                  ],
                                ),
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
                                              fontFamily: 'sans-serif-thin',
                                              fontWeight: FontWeight.bold),
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
                                              fontFamily: 'sans-serif-thin',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => Teacherdetails());
                              },
                              child: AnimatedContainer(duration:  Duration(milliseconds: 200),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(15),
                                  height: 200,
                                  width: 190,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.amber.shade50, Colors.yellow.shade400],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        25), // Rounded corners
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.yellow.shade300, // Shadow Color
                                        blurRadius: 5, // Blur (Kitna soft ho)
                                        offset: Offset(
                                            0, 4), // Shadow ka direction (X, Y)
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
                                          children: [Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Teachers',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontFamily: 'sans-serif-light',
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                '68 Members',
                                                style: TextStyle(

                                                    fontFamily: 'sans-serif-thin',
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),]
                                      ),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(EventPage());
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(right: 15),
                                height: 200,
                                width: 190,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.pink.shade50, Colors.pink.shade300],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pink.shade300,
                                      blurRadius: 5,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.event, size: 30, color: Colors.black),
                                        SizedBox(width: 105),
                                        Icon(Icons.arrow_forward_ios_outlined, size: 28, color: Colors.black),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Events',
                                              style: TextStyle(
                                                fontSize: 22, // fixed size
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Information',
                                              style: TextStyle(
                                                fontSize: 14, // fixed size
                                                fontFamily: 'sans-serif-light',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Row(
                                      children: [
                                        Text(
                                          'Events info',
                                          style: TextStyle(
                                            fontSize: 12, // fixed size
                                            fontFamily: 'sans-serif-thin',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 7),
                                        Container(
                                          height: 18,
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          'Holiday\'s',
                                          style: TextStyle(
                                            fontSize: 12, // fixed size
                                            fontFamily: 'sans-serif-thin',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: (){Get.to(Collegeinfo());},
                        child: AnimatedContainer(duration:  Duration(milliseconds: 200),
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(15),
                            height: 190,
                            width: 385,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.lightBlue.shade300,Colors.lightBlue.shade50],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.lightBlue.shade300, // Shadow Color
                                  blurRadius: 5, // Blur (Kitna soft ho)
                                  offset: Offset(0, 4), // Shadow ka direction (X, Y)
                                ),
                              ], // Rounded corners
                            ),
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
                            )),
                      ),
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
                        child: Container(
                          width: double.infinity,
                          height: 30,
                          color: Colors.blue[300],
                          alignment: Alignment.center,
                          child: Marquee(
                            text:
                            "©2025 All Rights Reserved by TeamCelestial    ", // Text scroll hoga
                            style: TextStyle(
                                fontFamily: 'nexalight',
                                fontSize: 13,
                                color: Colors.white),
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
                    ],
                  ),
                ),
              ]),
          ]),
    floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.mark_unread_chat_alt_outlined,color: Colors.lightBlueAccent,size: 35,),
    backgroundColor: Colors.white,
    shape: OvalBorder(),

    ),
      bottomNavigationBar: Container(
        height: 50,
          alignment: Alignment.center,
          color: Colors.black,
          child: Text("You Can't Access Student Bottom Navigation",style: TextStyle(fontFamily: 'nexaheavy',color: Colors.white),)),
    );
  }
}
