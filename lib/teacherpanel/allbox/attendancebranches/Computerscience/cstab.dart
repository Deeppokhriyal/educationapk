import 'package:educationapk/allpages/AttendancePage/cs/attendancecs.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/Computerscience/csfirst.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/Computerscience/cssecond.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/Computerscience/csthird.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cstab extends StatelessWidget {
  const Cstab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // ✅ Corrected to match the number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Attendance Register',
            style: TextStyle(fontFamily: 'nexaheavy', fontSize: 25),
          ),
          bottom: TabBar(
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(
              fontFamily: 'nexaheavy', // Custom font
              fontSize: 21,
            ),
            unselectedLabelColor: Colors.black, // Color for inactive tabs
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Nexalight', // Custom font
              fontSize: 14,
            ),
            tabs: [
              Tab(text: '1st Year'),
              Tab(text: '2nd Year'),
              Tab(text: '3rd Year'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Csfirst(),
            Cssecond(),
            Csthird(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(()=>AttendanceCSE());
          },
          child: Icon(
            Icons.edit_calendar,
            color: Colors.lightBlueAccent,
            size: 35,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
