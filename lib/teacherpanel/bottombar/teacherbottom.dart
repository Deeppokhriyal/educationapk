import 'package:educationapk/bottombar/application.dart';
import 'package:educationapk/teacherpanel/bottombar/teacherhome.dart';
import 'package:educationapk/teacherpanel/bottombar/teacherprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../bottombar/schedulerstart.dart';

class Teacherbar extends StatefulWidget {
  const Teacherbar({super.key});

  @override
  State<Teacherbar> createState() => _TeacherbarState();
}

class _TeacherbarState extends State<Teacherbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TeacherHome(),
    LeaveApplication(),
    Schedulerstart(),
    Teacherprofile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.blue,
          tabBackgroundColor: Colors.lightBlueAccent[100]!,
          gap: 5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          onTabChange: _onItemTapped,
          selectedIndex: _selectedIndex,
          tabs: const [
            GButton(icon: Icons.home, iconSize: 25, text: 'Home'),
            GButton(icon: Icons.bar_chart, iconSize: 25, text: 'Features'),
            GButton(icon: Icons.timer, iconSize: 25, text: 'Scheduler'),
            GButton(icon: Icons.person, iconSize: 25, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
