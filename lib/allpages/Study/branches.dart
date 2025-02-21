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
import 'package:get/get_core/src/get_main.dart';
class Branches extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
          children:[ Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://img.freepik.com/premium-photo/hd-wallpaper-image_945413-637.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                  fit: BoxFit.cover
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
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
                    GestureDetector(
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
                                  SizedBox(width: 106,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 106,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 110,),
                                  Icon(Icons.arrow_forward_ios_outlined,size:25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 110,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 30,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 105,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 105,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 105,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
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
                                  SizedBox(width: 125,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          )
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