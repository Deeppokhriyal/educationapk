import 'package:animate_do/animate_do.dart';
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


class Studentview extends StatefulWidget {

  @override
  State<Studentview> createState() => _StudentviewState();

}

class _StudentviewState extends State<Studentview> {
  List<String> listName=[
    "All",
    "Study",
    "Programming",
    "Attendance",
    "Branches",
    "Map",
    "Hostel",
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
                    image: DecorationImage(
                      image: NetworkImage('https://img.freepik.com/free-vector/white-gradient-background-modern-design_361591-4475.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                      // image: NetworkImage('https://img.freepik.com/free-vector/dark-blue-blurred-background_1034-589.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                      fit: BoxFit.cover,
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
                            padding: EdgeInsets.only(left: 90,top: 50),
                            child:
                            PopupMenuButton<String>(
                              onSelected: (String value) {
                                // Handle menu item selection
                                print('Selected: $value');
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem<String>(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Termscondition()));
                                    },
                                    value: 'Profile',
                                    child: Text('Terms and \nCondition\'s', style: TextStyle(fontSize: 15,fontFamily: 'sans-serif-thin')),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacypolicies()));
                                    },
                                    value: 'Settings',
                                    child: Text('Privacy  Policies', style: TextStyle(fontSize: 15,fontFamily: 'sans-serif-thin')),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: (){

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyLogin()));
                                    },
                                    value: 'Logout',
                                    child: Text('Logout', style: TextStyle(fontSize: 15,fontFamily: 'sans-serif-thin')),
                                  ),
                                ];
                              },
                              icon: Icon(Icons.menu,size: 30,color: Colors.black), // Icon to display
                              elevation: 5, // Shadow elevation
                              color: Colors.white, // Background color
                              offset: Offset(0, 45), // Positioning of the menu
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      SlideInLeft(
                        duration: Duration(milliseconds: 250),
                        child: Container(
                          margin: EdgeInsets.all(16),
                          child:TextField(style: TextStyle( fontFamily: 'sans-serif-light',height: 1.2,color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search,size: 30,color: Colors.black),
                              fillColor: Colors.black,
                              hintText: 'Search',hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder( // Unfocused border color
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),// Focused border color
                                  borderRadius: BorderRadius.circular(35)
                              ),

                            ),

                          ),
                        ),
                      ),
                      SlideInRight(
                        duration: Duration(milliseconds: 300),
                        child: Row(
                          children: [
                            Text("    Let's Explore\n        The Polyverse",style: TextStyle(fontSize: 42,fontFamily:'sans-serif-thin',color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(height: 7,),

                      SlideInLeft(
                        duration: Duration(milliseconds: 350),
                        child: SizedBox(
                          height: 83,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listName.length,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (listName[index] == "All") {
                                            Get.to(()=> MainScrollPage()
                                            );
                                          }if (listName[index] == "Attendance") {
                                            Get.to(()=> AttendanceHistory()
                                            );
                                          }if (listName[index] == "Branches") {
                                            Get.to(()=>MainScrollPage()
                                            );
                                          }
                                          if (listName[index] == "Study") {
                                            Get.to(()=>Branches()
                                            );
                                          }
                                          if (listName[index] == "Programming") {
                                            Get.to(()=>Programmingpage()
                                            );
                                          }
                                          if (listName[index] == "Map") {
                                            Get.to(()=>MyMap()
                                            );
                                          }
                                          if (listName[index] == "Hostels") {




                                            Get.to(()=>MyMap()
                                            );
                                          }


                                        },
                                        child: Container(
                                          width: 125,
                                          height: 40,
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25),
                                            border: Border.all(color: Colors.black26, width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.deepPurple.shade200,
                                                blurRadius: 7,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              listName[index],
                                              style: TextStyle(fontFamily: 'sans-serif-thin', fontSize: 15),
                                              textAlign: TextAlign.center, // Center align the text
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
                      ),
                      SlideInRight(
                        duration: Duration(milliseconds: 400),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(

                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 15),
                                height: 200,
                                width: 190,
                                decoration:
                                BoxDecoration(
                                  color: Color(0xFF00BFA6),
                                  // color: Colors.purple[200], // Background color
                                  // color: Color(0xCCCCCCFF), // Background color
                                  borderRadius: BorderRadius.circular(25),// Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF00BFA6), // Shadow Color
                                      spreadRadius: 3, // Spread (Kitna failaaye)
                                      blurRadius: 10, // Blur (Kitna soft ho)
                                      offset: Offset(0, 4), // Shadow ka direction (X, Y)
                                    ),
                                  ],
                                ),

                                child:  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Devpage()));
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.timelapse_rounded,size: 30,color: Colors.black),
                                            SizedBox(width: 105,),
                                            Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('App',style: TextStyle(fontSize: 30,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                Text('Designing',style: TextStyle(fontSize: 30,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 7,),
                                        Row(
                                          children: [
                                            Text('106 Days',style: TextStyle(fontFamily: 'sans-serif-thin'),),
                                            SizedBox(width: 7,),
                                            Container(
                                              height: 18,
                                              width: 1,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 7,),
                                            Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin'),),
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(()=>Teacherdetails());
                                },
                                child: Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 200,
                                    width: 155,
                                    decoration:
                                    BoxDecoration(
                                      // color: Color(0xFFFFC107),
                                      // color: Colors.greenAccent, // Background color
                                      color: Color(0xFFFFAB91), // Background color
                                      borderRadius: BorderRadius.circular(25),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFFFAB91), // Shadow Color
                                          spreadRadius: 3, // Spread (Kitna failaaye)
                                          blurRadius: 10, // Blur (Kitna soft ho)
                                          offset: Offset(0, 4), // Shadow ka direction (X, Y)
                                        ),
                                      ],
                                    ),

                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.person_pin_rounded,size: 30,color: Colors.black),
                                            SizedBox(width: 70,),
                                            Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                          ],
                                        ),
                                        SizedBox(height: 8,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Teachers',style: TextStyle(fontSize: 24,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                            Text('68 Members',style: TextStyle(fontSize: 14,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        Row(
                                          children: [

                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                              Container(

                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(right: 15),
                                height: 200,
                                width: 190,
                                decoration:
                                BoxDecoration(
                                  color: Color(0xFF90CAF9), // Background color
                                  // color: Colors.blueAccent[200], // Background color
                                  borderRadius: BorderRadius.circular(25),
                                  // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF90CAF9), // Shadow Color
                                      spreadRadius: 3, // Spread (Kitna failaaye)
                                      blurRadius: 10, // Blur (Kitna soft ho)
                                      offset: Offset(0, 4), // Shadow ka direction (X, Y)
                                    ),
                                  ],
                                ),

                                child:  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EventPage()));
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.event,size: 30,color: Colors.black),
                                            SizedBox(width: 105,),
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EventPage()));
                                              },
                                              child:
                                              Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Events',style: TextStyle(fontSize: 30,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                Text('Information',style: TextStyle(fontSize: 28,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Holidays',style: TextStyle(fontFamily: 'sans-serif-thin'),),
                                            SizedBox(width: 23,),
                                            Text('Calender',style: TextStyle(fontFamily: 'sans-serif-thin'),),
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container

                      SlideInUp(
                        duration: Duration(milliseconds: 400),
                        child: Container(

                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all( 15),
                            height: 190,
                            width: 385,
                            decoration:
                            BoxDecoration(
                              color: Color(0xFFCE93D8),// Background color
                              // color: Color(0xfffebee3), // Background color
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFCE93D8), // Shadow Color
                                  spreadRadius: 3, // Spread (Kitna failaaye)
                                  blurRadius: 10, // Blur (Kitna soft ho)
                                  offset: Offset(0, 4), // Shadow ka direction (X, Y)
                                ),
                              ],// Rounded corners

                            ),

                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Collegeinfo()));
                              },
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/images/clgbglogo.png',height: 65,),
                                      SizedBox(width: 8,),
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Government',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                          Text('Polytechnic Kashipur',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                        ],
                                      ),
                                      SizedBox(width: 20,),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Collegeinfo()));
                                          },
                                          child: Icon(Icons.arrow_forward_ios_outlined,size: 30,color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(height: 12,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('9 Branches',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                          Text('Engineering',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 16),),
                                          Text('Pharmacy',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                        ],
                                      ),
                                      SizedBox(width: 40,),
                                      SizedBox(
                                          child: Container(
                                            height: 70,
                                            width: 2,
                                            color: Colors.black,
                                          )
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Hostels',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                          Text('Boys',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 16),),
                                          Text('Girls',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          child:
                          Divider(height: 20,color: Colors.black,)
                      ),
                      Text('  Gallery',style: TextStyle(fontSize: 29,fontFamily: 'nexaheavy',color: Colors.black),),
                      Text('   Govt. Polytechnic Kashipur',style: TextStyle(fontSize: 16,fontFamily: 'nexaheavy',color: Colors.blue),),
                      SizedBox(height: 10,),
                      SingleChildScrollView(
                        padding: EdgeInsets.all(15),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Hero(
                                  tag: 'clg7Image', // Unique Hero tag
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/images/clg7.jpg',
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
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
                                Hero(
                                  tag: 'clg6Image', // Unique Hero tag
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/images/clg6.jpg',
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
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
                                Hero(
                                  tag: 'clg3Image', // Unique Hero tag
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/images/clg3.jpg',
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
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
                                Hero(
                                  tag: 'clg4Image', // Unique Hero tag
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/images/clg4.jpg',
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
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
                                Hero(
                                  tag: 'clg5Image', // Unique Hero tag
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/images/clg5.jpg',
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
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
                                Hero(
                                  tag: 'clg1Image', // Unique Hero tag
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/images/clg1.jpg',
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
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
                                Hero(
                                  tag: 'clg2Image', // Unique Hero tag
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/images/clg2.jpg',
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
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

                          child: Text('©2025 All Rights Reserved by Teamcelestial',style: TextStyle(fontFamily: 'nexalight',fontSize: 12,color: Colors.black),))
                    ],
                  ),
                ),
              ]
          ),
          ]
      ),
      bottomNavigationBar: Container(
        height: 50,
          alignment: Alignment.center,
          color: Colors.black,
          child: Text("You Can't Access Student Bottom Navigation",style: TextStyle(fontFamily: 'nexaheavy',color: Colors.white),)),
    );
  }
}
