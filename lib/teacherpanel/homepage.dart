import 'package:educationapk/bottombar/application.dart';
import 'package:educationapk/bottombar/homepage.dart';
import 'package:educationapk/devpage.dart';
import 'package:educationapk/popupmenu/privacypolicies.dart';
import 'package:educationapk/popupmenu/termscondition.dart';
import 'package:educationapk/bottombar/profilepage.dart';
import 'package:educationapk/teacherpanel/allbox/applications.dart';
import 'package:educationapk/teacherpanel/allbox/assignments.dart';
import 'package:educationapk/teacherpanel/allbox/attendance.dart';
import 'package:educationapk/teacherpanel/allbox/students%20profile.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/teachers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMainHome(),
      debugShowCheckedModeBanner: false,
      title: 'home page',
    );
  }
}
class MyMainHome extends StatefulWidget {
  const MyMainHome({super.key});

  @override
  State<MyMainHome> createState() => _MyMainHomeState();
}

class _MyMainHomeState extends State<MyMainHome> {


  int _selectedIndex = 0;
  int _tapCount = 0;
  // Method to handle item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
    switch (_selectedIndex) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        if (_selectedIndex == index) {
          _tapCount++;
          if(_tapCount==2){Navigator.push(
              context, MaterialPageRoute(builder: (context) => LeaveApplication()));
          _tapCount = 0;}
        }
        break;
      case 3:
        if (_selectedIndex == index) {
          _tapCount++;
          if(_tapCount==2){Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profilepage()));
          _tapCount = 0;}
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
            children:[ Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://img.freepik.com/premium-photo/colors-card-template-curve-gradient-abstract-background_608068-9824.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.black12,
                                            radius: 40,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile.png'),
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            'Shivanshi Mishra',
                                            style: TextStyle(fontSize: 17, fontFamily:'sans-serif-light'),
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Head of Department',
                                            style: TextStyle(color: Colors.grey,fontFamily: 'sans-serif-thin'),
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Information Technology',
                                            style: TextStyle(color: Colors.grey,fontFamily: 'sans-serif-thin'),
                                          ),
                                          SizedBox(height: 25),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Close',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 14),),
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
                                padding: EdgeInsets.only(left: 13,top: 50),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      'assets/images/profile.png'),
                                ),
                              ),
                            ),
                            SizedBox(width: 23,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text('Name ?', style: TextStyle(fontSize: 17,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold,color: Colors.black),),
                                ),
                                Text('Good Morning', style: TextStyle(fontSize: 14,fontFamily: 'sans-serif-thin',color:Colors.black),),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 155,top: 50),
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
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("   Let's Explore\n       The Polyverse",style: TextStyle(fontSize: 44,fontFamily:'sans-serif-thin',color: Colors.white),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 7,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.lightGreen[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.lightGreenAccent, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
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
                                                Container(
                                                  child:
                                                  Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                                ),
                                                SizedBox(width: 97,),
                                                Container(
                                                  child:
                                                  GestureDetector(
                                                    onTap: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Devpage()));
                                                    },
                                                    child:
                                                    Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('App',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                    Text('Designing',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                                SizedBox(width: 20,),
                                                Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.lightGreen[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.lightGreenAccent, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
                                        ),
                                      ],
                                    ),

                                    child:  GestureDetector(
                                        onTap: (){
                                          Get.to(TeachersPage());
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child:
                                                  Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                                ),
                                                SizedBox(width: 97,),
                                                Container(
                                                  child:
                                                  Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Teacher\'s',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                                SizedBox(width: 20,),
                                                Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.lightBlue[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.lightBlueAccent, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
                                        ),
                                      ],
                                    ),

                                    child:  GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendancePage()));
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child:
                                                  Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                                ),
                                                SizedBox(width: 97,),
                                                Container(
                                                  child:
                                                  Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Attendance',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                                SizedBox(width: 20,),
                                                Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.lightBlue[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.lightBlueAccent, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
                                        ),
                                      ],
                                    ),

                                    child:  GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplicationsPage()));
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child:
                                                  Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                                ),
                                                SizedBox(width: 97,),
                                                Container(
                                                  child:
                                                  Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Application\'s',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                                SizedBox(width: 20,),
                                                Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.pink[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.pinkAccent, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
                                        ),
                                      ],
                                    ),

                                    child:  GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AssignmentsPage()));
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child:
                                                  Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                                ),
                                                SizedBox(width: 97,),
                                                Container(
                                                  child:
                                                  Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Assignment\'s',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                                SizedBox(width: 20,),
                                                Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.pink[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.pinkAccent, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
                                        ),
                                      ],
                                    ),

                                    child:  GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Myhome()));
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child:
                                                  Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                                ),
                                                SizedBox(width: 97,),
                                                Container(
                                                  child:
                                                  Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Log in',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                    Text('As a Student',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                                SizedBox(width: 20,),
                                                Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.yellowAccent[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.yellow, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
                                        ),
                                      ],
                                    ),

                                    child:  Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child:
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                            ),
                                            SizedBox(width: 97,),
                                            Container(
                                              child:
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SyllabusPage()));
                                                },
                                                child:
                                                Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Syllabus',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                            SizedBox(width: 20,),
                                            Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(15),
                                    height: 180,
                                    width: 175,
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.yellowAccent[100], // Background color
                                      borderRadius: BorderRadius.circular(20),// Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.yellow, // Shadow color
                                          blurRadius: 15, // Shadow blur radius
                                          offset: Offset(0, 2), // Shadow offset
                                        ),
                                      ],
                                    ),

                                    child:  GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentProfilePage()));
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child:
                                                  Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                                ),
                                                SizedBox(width: 97,),
                                                Container(
                                                  child:
                                                  Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Student',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                    Text('Profile\'s',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                                SizedBox(width: 20,),
                                                Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ),

                        //blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container

                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(15),
                          child:
                          Divider(height: 25,),
                        ),
                        Text('  Gallery',style: TextStyle(fontSize: 29,fontFamily: 'nexaheavy',color: Colors.white),),
                        Text('   Govt. Polytechnic Kashipur',style: TextStyle(fontSize: 16,fontFamily: 'nexalight',color: Colors.lightBlueAccent),),
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          padding: EdgeInsets.all(15),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Image.asset('assets/images/man.png',height: 200,),
                              SizedBox(width: 30,),
                              Image.asset('assets/images/woman.png',height: 200,),
                              SizedBox(width: 30,),
                              Image.asset('assets/images/man.png',height: 200,),
                              SizedBox(width: 30,),
                              Image.asset('assets/images/woman.png',height: 200,),
                              SizedBox(width: 30,),
                              Image.asset('assets/images/man.png',height: 200,),
                              SizedBox(width: 30,),
                              Image.asset('assets/images/woman.png',height: 200,),
                            ],
                          ),
                        ),
                        Container(

                          alignment: Alignment.center,
                          width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(),

                            ),
                            child:
                            Text('©2025 All Rights Reserved by Teamcelestial',style: TextStyle(fontFamily: 'nexalight',fontSize: 13,color: Colors.black),)
                        ),
                      ],
                    ),
                  ),
                ]
            ),
            ]
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.blue,
            tabBackgroundColor: Colors.lightBlueAccent[100]!,
            gap: 5,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            onTabChange: (index) =>_onItemTapped(index),
            tabs: [
              GButton(icon: Icons.home,iconSize: 25,text: 'Home',textStyle: TextStyle(fontFamily: 'sans-serif-light'),),
              GButton(icon: Icons.bar_chart,iconSize: 25,text: 'Features',textStyle: TextStyle(fontFamily: 'sans-serif-light'),),
              GButton(icon: Icons.add_chart,iconSize: 25,text: 'Application',textStyle: TextStyle(fontFamily: 'sans-serif-light'),),
              GButton(icon: Icons.person,iconSize: 25,text: 'Profile',textStyle: TextStyle(fontFamily: 'sans-serif-light'),),

            ],
          ),
        )
    );
  }
}
