import 'package:educationapk/allpages/Study/branches.dart';
import 'package:educationapk/allpages/AttendancePage/attendance.dart';
import 'package:educationapk/allpages/map.dart';
import 'package:educationapk/allpages/programmingpage.dart';
import 'package:educationapk/allpages/studentAssignment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainScrollPage extends StatefulWidget {
  @override
  State<MainScrollPage> createState() => _MainScrollPageState();
}
class _MainScrollPageState extends State<MainScrollPage> {  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.transparent,
      body: Stack(
          children:[ Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.lightGreen, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(height: 70,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 100,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.amber, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(Branches());
                          },
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.border_all,size: 45,color: Colors.black),
                                  SizedBox(width: 12,),
                                  Column(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Study',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                      Text(' Material',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                    ],
                                  ),
                                  SizedBox(width: 162,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 15,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 100,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.amber,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 4),// Shadow offset
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(Programmingpage());
                          },
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.language,size: 45,color: Colors.black),
                                  SizedBox(width: 12,),
                                  Column(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Programming',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                      Text(' Languages',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                    ],
                                  ),
                                  SizedBox(width: 114,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 15,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 100,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.amber,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(AttendanceHistory());
                          },child:
                          Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.add_chart,size: 45,color: Colors.black),
                                  SizedBox(width: 12,),
                                  Column(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Attendance',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                      Text(' Tracking',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                    ],
                                  ),
                                  SizedBox(width: 130,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 15,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 100,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.amber,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Get.to((StudentAssignment()));
                          },
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.my_library_books,size: 45,color: Colors.black),
                                  SizedBox(width: 12,),
                                  Column(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Assignments',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                      Text(' Detail\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                    ],
                                  ),
                                  SizedBox(width: 119,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 15,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 100,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.amber,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMap()));
                            Get.to(MyMap());
                          },
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.map_sharp,size: 45,color: Colors.black),
                                  SizedBox(width: 12,),
                                  Column(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Map',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                      Text(' Govt. Poly Kashipur',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                    ],
                                  ),
                                  SizedBox(width: 84,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 15,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 100,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.amber, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined,size: 45,color: Colors.black),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hostels',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                    Text('Information',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 18),),
                                  ],
                                ),
                                SizedBox(width: 144,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.black),
                              ],
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 15,),
                  ]
              ),
            ),
          ),
          ]
      )

  );
}
}