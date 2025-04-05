import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int? studentCount;
  int? teacherCount;
  int? adminCount;

  @override
  void initState() {
    super.initState();
    fetchUserCounts();
  }

  Future<void> fetchUserCounts() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
      int students = 0;
      int teachers = 0;
      int admins = 0;

      for (var doc in snapshot.docs) {
        String role = doc['role'];
        if (role == 'student') {
          students++;
        } else if (role == 'teacher') {
          teachers++;
        } else if (role == 'admin') {
          admins++;
        }
      }

      setState(() {
        studentCount = students;
        teacherCount = teachers;
        adminCount = admins;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'User Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'nexaheavy',
            fontSize: 23,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blueGrey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: studentCount == null || teacherCount == null || adminCount == null
                ? SpinKitWave(color: Colors.white, size: 50)
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '[ Total Users ]',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'nexaheavy',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.white70, thickness: 2),
                _buildStatCard('Students', studentCount!, FontAwesomeIcons.userGraduate, Colors.lightBlueAccent),
                _buildStatCard('Teachers', teacherCount!, FontAwesomeIcons.chalkboardTeacher, Colors.tealAccent),
                _buildStatCard('Admins', adminCount!, FontAwesomeIcons.userShield, Colors.redAccent),
                Divider(color: Colors.white70, thickness: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int count, IconData icon, Color iconColor) {
    return Card(
      color: Colors.blueGrey[800],
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, size: 35, color: iconColor),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'nexaheavy',
            color: Colors.white,
          ),
        ),
        trailing: Text(
          '$count',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
