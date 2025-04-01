import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      appBar: AppBar(title: Text('User Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: studentCount == null || teacherCount == null || adminCount == null
            ? Center(child: SpinKitThreeBounce(
          color: Colors.lightBlue,
          size: 40,
        ))
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatCard('Total Students', studentCount!, Colors.blue),
            _buildStatCard('Total Teachers', teacherCount!, Colors.green),
            _buildStatCard('Total Admins', adminCount!, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int count, Color color) {
    return Card(
      color: color.withOpacity(0.2),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        trailing: Text('$count', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }
}