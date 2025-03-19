import 'package:animate_do/animate_do.dart';
import 'package:educationapk/allpages/Study/IT_syllabus.dart';
import 'package:educationapk/allpages/Study/Mech_syllabus.dart';
import 'package:educationapk/allpages/Study/ag_syllabus.dart';
import 'package:educationapk/allpages/Study/chem_syllabus.dart';
import 'package:educationapk/allpages/Study/chempaint_syllabus.dart';
import 'package:educationapk/allpages/Study/civil_syllabus.dart';
import 'package:educationapk/allpages/Study/cse_syllabus.dart';
import 'package:educationapk/allpages/Study/electronic_syllabus.dart';
import 'package:educationapk/allpages/Study/pharmacy_syllabus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Branches extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
          children:[ Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade200, Colors.pink.shade200,Colors.pink.shade200], // Three colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4, 1.0], // Defines the positions of colors
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    SlideInDown(
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        child: Text(
                          'Branches',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 35,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SlideInRight(
                      duration: Duration(milliseconds: 500),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(AgSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Color(0xfffebee3), // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.agriculture,size: 40,color: Colors.black),
                                    SizedBox(width: 15,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Agriculture \nEngineering',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                        // Text(' Material',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                      ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.29,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 600),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ChempaintSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 127,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Color(0xfffebee3),  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2),// Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.palette_outlined,size: 40,color: Colors.black),
                                    SizedBox(width: 12,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Chemical \nTechnology',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                        Text('(Paint)',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                      ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.32,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 700),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ChemSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Color(0xfffebee3),  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.bubble_chart_outlined,size: 40,color: Colors.black),
                                    SizedBox(width: 12,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Chemical \nEngineering',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                      ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3,),
                                    Icon(Icons.arrow_forward_ios_outlined,size:25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 800),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(CivilSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Color(0xfffebee3),  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color:Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.engineering_outlined,size: 40,color: Colors.black),
                                    SizedBox(width: 15,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Civil \nEngineering',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                               ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.28,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 900),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(CseSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Color(0xfffebee3),  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.computer_sharp,size: 40,color: Colors.black),
                                    SizedBox(width: 12,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Computer Science \n& Engineering',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                           ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 1000),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(ElectronicSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Color(0xfffebee3), // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color:Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.electrical_services,size: 40,color: Colors.black),
                                    SizedBox(width: 12,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Electronics \nEngineering',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                           ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 1100),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(ItSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Color(0xfffebee3), // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.desktop_mac_outlined,size: 40,color: Colors.black),
                                    SizedBox(width: 12,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Information \nTechnology',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                      ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 1200),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(MechSyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Color(0xfffebee3), // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.miscellaneous_services,size: 40,color: Colors.black),
                                    SizedBox(width: 12,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Mechanical \nEngineering',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                      ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.3,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SlideInRight(
                      duration: Duration(milliseconds: 1000),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(PharmacySyllabus());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Color(0xfffebee3), // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfffebee3), // Shadow color
                                  blurRadius: 8, // Shadow blur radius
                                  offset: Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.medical_services,size: 40,color: Colors.black),
                                    SizedBox(width: 12,),
                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Pharmacy',style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
                                      ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.34,),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                  ]
              ),
            ),
          ),
          ]
      )

  );
}}