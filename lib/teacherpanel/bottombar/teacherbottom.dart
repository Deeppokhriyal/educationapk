import 'package:educationapk/teacherpanel/bottombar/eventupload.dart';
import 'package:educationapk/teacherpanel/bottombar/teacherhome.dart';
import 'package:educationapk/teacherpanel/bottombar/teacherprofile.dart';
import 'package:educationapk/teacherpanel/bottombar/teacherschedulerstart.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Teacherbar extends StatefulWidget {
  const Teacherbar({super.key});

  @override
  State<Teacherbar> createState() => _TeacherbarState();
}

class _TeacherbarState extends State<Teacherbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TeacherHome(),
    EventUpload(),
    TeacherSchedulerstart(),
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
            GButton(icon: Icons.event, iconSize: 25, text: 'Events'),
            GButton(icon: Icons.timer, iconSize: 25, text: 'Scheduler'),
            GButton(icon: Icons.person, iconSize: 25, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
