import 'package:educationapk/allpages/Study/branches.dart';
import 'package:educationapk/allpages/AttendancePage/attendance.dart';
import 'package:educationapk/allpages/map.dart';
import 'package:educationapk/allpages/programmingpage.dart';
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
                colors: [Colors.blueGrey, Colors.black87],
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
                        height: 130,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.lightBlueAccent, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent, // Shadow color
                              blurRadius: 8, // Shadow blur radius
                              offset: Offset(0, 7), // Shadow offset
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
                                      Text(' Material',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                    ],
                                  ),
                                  SizedBox(width: 162,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
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
                        height: 130,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.lightBlueAccent,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent, // Shadow color
                              blurRadius: 8, // Shadow blur radius
                              offset: Offset(0, 6),// Shadow offset
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
                                      Text(' Languages',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                    ],
                                  ),
                                  SizedBox(width: 89,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
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
                        height: 130,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.lightBlueAccent,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent, // Shadow color
                              blurRadius: 8, // Shadow blur radius
                              offset: Offset(0, 6), // Shadow offset
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
                                      Text(' Tracking',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                    ],
                                  ),
                                  SizedBox(width: 110,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
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
                        height: 130,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.lightBlueAccent,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent, // Shadow color
                              blurRadius: 8, // Shadow blur radius
                              offset: Offset(0, 6), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_tree_outlined,size: 45,color: Colors.black),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Branches',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                    Text(' Detail\'s',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 128,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
                              ],
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 15,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 130,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.lightBlueAccent,  // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent, // Shadow color
                              blurRadius: 8, // Shadow blur radius
                              offset: Offset(0, 6), // Shadow offset
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
                                      Text(' Govt. Poly Kashipur',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                    ],
                                  ),
                                  SizedBox(width: 105,),
                                  Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
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
                        height: 130,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.lightBlueAccent, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent, // Shadow color
                              blurRadius: 8, // Shadow blur radius
                              offset: Offset(0, 6), // Shadow offset
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
                                    Text('Information',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 144,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
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