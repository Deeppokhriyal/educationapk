import 'package:educationapk/teacherpanel/allbox/syllabus/IT_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/Mech_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/ag_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/chem_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/chempaint_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/civil_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/cse_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/electronic_syllabus.dart';
import 'package:educationapk/teacherpanel/allbox/syllabus/pharmacy_syllabus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SyllabusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
            children:[ Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-vector/background-colorful-modern-design_677411-3926.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
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
                              color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(AgSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Colors.greenAccent, // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown, // Shadow color
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
                          Get.to(ChempaintSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 127,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Colors.greenAccent,  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown, // Shadow color
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
                          Get.to(ChemSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Colors.greenAccent,  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown, // Shadow color
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
                          Get.to(CivilSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Colors.greenAccent,  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.brown, // Shadow color
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
                          Get.to(CseSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Colors.greenAccent,  // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown, // Shadow color
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
                          Get.to(ElectronicSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color:Colors.greenAccent, // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.brown, // Shadow color
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
                          Get.to(ItSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Colors.greenAccent, // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown, // Shadow color
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
                          Get.to(MechSyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Colors.greenAccent, // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown, // Shadow color
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
                          Get.to(PharmacySyllabus1());
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(17),
                            height: 100,
                            width: 370,
                            decoration:
                            BoxDecoration(
                              color: Colors.greenAccent, // Background color
                              borderRadius: BorderRadius.circular(20),// Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown, // Shadow color
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