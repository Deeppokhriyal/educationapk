import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/allpage.dart';
import 'package:educationapk/allpages/programmingpage.dart';
import 'package:educationapk/bottombar/application.dart';
import 'package:educationapk/homepagewidgets/collegeinfo.dart';
import 'package:educationapk/homepagewidgets/devpage.dart';
import 'package:educationapk/allpages/map.dart';
import 'package:educationapk/homepagewidgets/eventpage.dart';
import 'package:educationapk/popupmenu/privacypolicies.dart';
import 'package:educationapk/popupmenu/termscondition.dart';
import 'package:educationapk/bottombar/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../allpages/Study/branches.dart';


class MyMainHome extends StatefulWidget {

  @override
  State<MyMainHome> createState() => _MyMainHomeState();

}

class _MyMainHomeState extends State<MyMainHome> {
  List<String> listName=[
    "All",
    "Study",
    "Programming",
    "Attendance",
    "Branches",
    "Map",
    "Hostel",
  ];

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

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String userName = "";
  String userProfileImage = "";

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
          userName = userData["name"];
          userProfileImage = userData["profileImage"];
        });
      }
    }
  }


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
                    image: NetworkImage('https://img.freepik.com/premium-photo/gradient-color-background-colorful-vibrant-colors-multicolored-bright-colors-radiant-spectrum_955379-14351.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
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
                                        backgroundImage: userProfileImage.isNotEmpty
                                            ? NetworkImage(userProfileImage)
                                            : AssetImage('assets/images/profile.png')
                                        as ImageProvider,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        userName.isNotEmpty ? userName : "Guest",
                                        style: TextStyle(fontSize: 17, fontFamily:'sans-serif-light'),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'I.T. 3rd Year',
                                        style: TextStyle(color: Colors.black,fontFamily: 'sans-serif-thin'),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Govt. Polytechnic Kashipur',
                                        style: TextStyle(color: Colors.black,fontFamily: 'sans-serif-thin'),
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
                              backgroundImage: userProfileImage.isNotEmpty
                                  ? NetworkImage(userProfileImage)
                                  : AssetImage('assets/images/profile.png') as ImageProvider,
                            ),
                          ),
                        ),
                        SizedBox(width: 23,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 50),
                              child: Text('Hii Dear,', style: TextStyle(fontSize: 13,fontFamily: 'nexaheavy',fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                            Text( userName.isNotEmpty ? userName : "Guest", style: TextStyle(fontSize: 15,fontFamily: 'nexalight',color:Colors.white),),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 135,top: 50),
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
                            icon: Icon(Icons.menu,size: 30,color: Colors.white), // Icon to display
                            elevation: 5, // Shadow elevation
                            color: Colors.white, // Background color
                            offset: Offset(0, 45), // Positioning of the menu
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.all(16),
                      child:TextField(style: TextStyle( fontFamily: 'sans-serif-light',height: 1.2,color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search,size: 30,color: Colors.white),
                          fillColor: Colors.white,
                          hintText: 'Search',hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder( // Unfocused border color
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),// Focused border color
                              borderRadius: BorderRadius.circular(35)
                          ),

                        ),

                      ),
                    ),
                    Row(
                      children: [
                        Text("    Let's Explore\n        The Polyverse",style: TextStyle(fontSize: 42,fontFamily:'sans-serif-thin',color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 7,),

                    SizedBox(
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MainScrollPage()),
                                        );
                                      }
                                      if (listName[index] == "Study") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>Branches()),
                                        );
                                      }
                                      if (listName[index] == "Programming") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => programmingpage()),
                                        );
                                      }
                                      if (listName[index] == "Map") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyMap()),
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
                                        border: Border.all(color: Colors.black12, width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.deepPurple.shade200,
                                            blurRadius: 5,
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(

                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 10),
                            height: 200,
                            width: 190,
                            decoration:
                            BoxDecoration(
                              color: Colors.purple[200], // Background color
                              // color: Color(0xCCCCCCFF), // Background color
                              borderRadius: BorderRadius.circular(25),// Rounded corners
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
                                          Icon(Icons.timelapse_rounded,size: 30,color: Colors.black),
                                        ),
                                        SizedBox(width: 105,),
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
                          Container(

                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 8),
                              height: 200,
                              width: 155,
                              decoration:
                              BoxDecoration(
                                color: Colors.greenAccent, // Background color
                                // color: Color(0xbbbefed1), // Background color
                                borderRadius: BorderRadius.circular(25),// Rounded corners
                              ),

                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child:
                                        Icon(Icons.person_pin_rounded,size: 30,color: Colors.black),
                                      ),
                                      SizedBox(width: 70,),
                                      Container(
                                        child:
                                        Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                      ),
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
                          Container(

                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 8),
                            height: 200,
                            width: 190,
                            decoration:
                            BoxDecoration(
                              color: Colors.blueAccent[200], // Background color
                              borderRadius: BorderRadius.circular(25),// Rounded corners
                            ),

                            child:  GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Eventpage()));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child:
                                          Icon(Icons.event,size: 30,color: Colors.black),
                                        ),
                                        SizedBox(width: 105,),
                                        Container(
                                          child:
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Eventpage()));
                                            },
                                            child:
                                            Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                          ),
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

                    //blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container blue container

                    Container(

                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(left: 10,top: 15),
                        height: 190,
                        width: 385,
                        decoration:
                        BoxDecoration(
                          color: Color(0xfffebee3), // Background color
                          borderRadius: BorderRadius.circular(30),// Rounded corners

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
                                  Container(
                                    child:
                                      Image.asset('assets/images/clgbglogo.png',height: 50,),
                                    // Icon(Icons.school,size: 45,color: Colors.black),
                                  ),
                                  SizedBox(width: 12,),
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
                                      Text(' 9 Branches',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
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
                    Container(
                      padding: EdgeInsets.all(15),
                      child:
                      Divider(height: 25,),
                    ),
                    Text('  Gallery',style: TextStyle(fontSize: 29,fontFamily: 'nexaheavy',color: Colors.white),),
                    Text('   Govt. Polytechnic Kashipur',style: TextStyle(fontSize: 16,fontFamily: 'nexaheavy',color: Colors.lightBlueAccent),),
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
