import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/homepagewidgets/devpage.dart';
import 'package:educationapk/homepagewidgets/images/fullscreen1.dart';
import 'package:educationapk/popupmenu/privacypolicies.dart';
import 'package:educationapk/popupmenu/termscondition.dart';
import 'package:educationapk/teacherpanel/allbox/applications.dart';
import 'package:educationapk/teacherpanel/allbox/assignments.dart';
import 'package:educationapk/teacherpanel/allbox/attendance.dart';
import 'package:educationapk/teacherpanel/allbox/students%20profile.dart';
import 'package:educationapk/teacherpanel/allbox/studentview.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/teachers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String teacherName = "";
  String teacherProfileImage = "";
  String teacherPost = "";
  String teacherBranch = "";

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
          teacherName = userData["name"];
          teacherProfileImage = userData["profileImage"];
          teacherPost= userData["post"];
          teacherBranch = userData["branch"];
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
      home: MyMainHome(
        teacherName: teacherName,
        teacherProfileImage: teacherProfileImage,
        teacherPost: teacherPost,
        teacherBranch: teacherBranch,
      ),
      debugShowCheckedModeBanner: false,
      title: 'home page',
    );
  }
}
class MyMainHome extends StatefulWidget {
  final String teacherName;
  final String teacherProfileImage;
  final String teacherPost;
  final String teacherBranch;

  const MyMainHome({
    Key? key,
    required this.teacherName,
    required this.teacherProfileImage,
    required this.teacherPost,
    required this.teacherBranch,
  }) : super(key: key);

  @override
  State<MyMainHome> createState() => _MyMainHomeState();
}

class _MyMainHomeState extends State<MyMainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.all(4),
            children:[ Stack(
              alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://img.freepik.com/premium-photo/colors-card-template-curve-gradient-abstract-background_608068-9824.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.orange.shade50, Colors.lightBlueAccent.shade100],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius:  BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.black12,
                                            radius: 40,
                                            backgroundImage: widget.teacherProfileImage.isNotEmpty
                                                ? NetworkImage(widget.teacherProfileImage)
                                                : AssetImage('assets/images/profile.png')
                                            as ImageProvider,
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            widget.teacherName.isNotEmpty ? widget.teacherName : "name",
                                            style: TextStyle(fontSize: 17, fontFamily:'nexaheavy'),
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            widget.teacherPost.isNotEmpty ? widget.teacherPost : "post",
                                            style: TextStyle(color: Colors.black,fontFamily: 'nexalight'),
                                          ),SizedBox(height: 6),
                                          Text(
                                            widget.teacherBranch.isNotEmpty ? widget.teacherBranch : "branch",
                                            style: TextStyle(color: Colors.black,fontFamily: 'nexalight'),
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Govt. Polytechnic Kashipur',
                                            style: TextStyle(color: Colors.black,fontFamily: 'nexaheavy'),
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
                                  backgroundImage: widget.teacherProfileImage.isNotEmpty
                                      ? NetworkImage(widget.teacherProfileImage)
                                      : AssetImage('assets/images/profile.png') as ImageProvider,
                                ),
                              ),
                            ),
                            SizedBox(width: 23,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text('Namskaram', style: TextStyle(fontSize: 13,fontFamily: 'sans-serif-thin',fontWeight: FontWeight.bold,color: Colors.black),),
                                ),
                                Text(widget.teacherName.isNotEmpty ? widget.teacherName : "Teacher", style: TextStyle(fontSize: 15,fontFamily: 'sans-serif-light',color:Colors.black),),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 120,top: 50),
                              child:
                              PopupMenuButton<String>(
                                onSelected: (String value) {
                                  // Handle menu item selection
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem<String>(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Termscondition()));
                                      },
                                      value: 'Profile',
                                      child: Text('Terms and \nCondition\'s', style: TextStyle(fontSize: 17,fontFamily: 'sans-serif-light')),
                                    ),
                                    PopupMenuItem<String>(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacypolicies()));
                                      },
                                      value: 'Settings',
                                      child: Text('Privacy  Policies', style: TextStyle(fontSize: 17,fontFamily: 'sans-serif-light')),
                                    ),
                                    PopupMenuItem<String>(
                                      onTap: (){

                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyLogin()));
                                      },
                                      value: 'Logout',
                                      child: Text('Logout', style: TextStyle(fontSize: 17,fontFamily: 'sans-serif-light')),
                                    ),
                                  ];
                                },
                                icon: Icon(Icons.menu,size: 28,color: Colors.black), // Icon to display
                                elevation: 5, // Shadow elevation
                                color: Colors.white, // Background color
                                offset: Offset(0, 45), // Positioning of the menu
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(" Let's Explore\n      The Polyverse",style: TextStyle(fontSize: 44,fontFamily:'sans-serif-thin',color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(

                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                        Get.to(()=>Devpage());
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.21),
                                              GestureDetector(
                                                onTap: (){
                                                  Get.to(()=>Devpage());
                                                },
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
                                                  Text('App',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                  Text('Designing',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Text('Developed By 2 Developer\'s in 90 Days',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),

                                        ],
                                      )
                                  ),
                                ),
                                Container(

                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.21),
                                              Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
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
                                          Text('All Registered Teacher\'s in this Page',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
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
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                        Get.to(()=>AttendanceScreen());
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.21),
                                              Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
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
                                          Text('Mark the Attendance of students',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),

                                         ],
                                      )
                                  ),
                                ),
                                Container(

                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                        Get.to(()=>LeaveApplicationsList());
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveApplicationsList() ));
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.21),
                                              Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
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
                                          Text('Received the Application of the Students',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),

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
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                        Get.to(()=>AssignmentsPage());
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.21),
                                              Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
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
                                          Text('you can give Assignments via this feature',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),

                                         ],
                                      )
                                  ),
                                ),
                                Container(

                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                        Get.to(()=>Studentview());
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.21),
                                              Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
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
                                          Text('Saw Student feature\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),

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
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.21),
                                          GestureDetector(
                                            onTap: (){
                                              Get.to(()=>SyllabusPage());
                                            },
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
                                              Text('Syllabus',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Text('All Syllabus Available',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                     ],
                                  ),
                                ),
                                Container(

                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  height: 165,
                                  width: MediaQuery.of(context).size.width * 0.43,
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
                                        Get.to(()=>StudentProfilePage());
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.21),
                                              Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
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
                                          SizedBox(height: 5,),
                                          Text('Only your Branch Registered Student\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),

                                         ],
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>Fullscreen(img: 'assets/images/clg7.jpg',tag: 'clg7Image',),);
                                },
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'clg7Image', // Unique Hero tag
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          'assets/images/clg7.jpg',
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text('Academic Block',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),


                                  ],
                                ),
                              ),
                              SizedBox(width: 15,),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>Fullscreen(img: 'assets/images/clg6.jpg',tag: 'clg6Image',),);

                                },
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'clg6Image', // Unique Hero tag
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          'assets/images/clg6.jpg',
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text('IT Block',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),

                                  ],
                                ),
                              ),
                              SizedBox(width: 15,),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>Fullscreen(img: 'assets/images/clg3.jpg',tag: 'clg3Image',),);

                                },
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'clg3Image', // Unique Hero tag
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          'assets/images/clg3.jpg',
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text('Digital Library',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),

                                  ],
                                ),
                              ),
                              SizedBox(width: 15,),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>Fullscreen(img: 'assets/images/clg4.jpg',tag: 'clg4Image',),);

                                },
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'clg4Image', // Unique Hero tag
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          'assets/images/clg4.jpg',
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text('Canteen',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),

                                  ],
                                ),
                              ),
                              SizedBox(width: 15,),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>Fullscreen(img: 'assets/images/clg5.jpg',tag: 'clg5Image',),);

                                },
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'clg5Image', // Unique Hero tag
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          'assets/images/clg5.jpg',
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text('Workshop\'s',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),

                                  ],
                                ),
                              ),

                              SizedBox(width: 15,),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>Fullscreen(img: 'assets/images/clg1.jpg',tag: 'clg1Image',),);

                                },
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'clg1Image', // Unique Hero tag
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          'assets/images/clg1.jpg',
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text('NCC Block',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),

                                  ],
                                ),
                              ),
                              SizedBox(width: 15,),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>Fullscreen(img: 'assets/images/clg2.jpg',tag: 'clg2Image',),);
                                },
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'clg2Image', // Unique Hero tag
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          'assets/images/clg2.jpg',
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text('Parking',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),

                                  ],
                                ),
                              ),
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
                            Text('©2025 All Rights Reserved by Teamcelestial',style: TextStyle(fontFamily: 'nexalight',fontSize: 13,color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                ]
            ),
            ]
        ),
    );
  }
}
