import 'package:educationapk/allpages/AttendancePage/Elec/attendanceelec.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/electronics/elecfirst.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/electronics/elecsecond.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/electronics/electhird.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elextab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
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
            Elecfirst(),
            Elecsecond(),
            Electhird(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(()=>Attendanceelec());

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