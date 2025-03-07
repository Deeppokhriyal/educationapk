import 'package:educationapk/teacherpanel/allbox/attendancebranches/civil/civilfirst.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/civil/civilsecond.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/civil/civilthird.dart';
import 'package:flutter/material.dart';

class Civiltab extends StatelessWidget {
  const Civiltab({super.key});

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
            Civilfirst(),
            Civilsecond(),
            Civilthird(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
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