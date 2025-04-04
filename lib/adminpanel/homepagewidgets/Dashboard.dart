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
      appBar: AppBar(
        title: Text('User Dashboard', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'nexaheavy',fontSize: 23,color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.purpleAccent.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: studentCount == null || teacherCount == null || adminCount == null
                ? Center(child: SpinKitWave(color: Colors.white, size: 50))
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('[ Total Users ]',style: TextStyle(fontSize: 25,fontFamily: 'nexaheavy'),),
                SizedBox(height: 20,),
                Divider(thickness: 3,),
                _buildStatCard('Students', studentCount!, FontAwesomeIcons.userGraduate, Colors.blue),
                _buildStatCard('Teachers', teacherCount!, FontAwesomeIcons.chalkboardTeacher, Colors.green),
                _buildStatCard('Admins', adminCount!, FontAwesomeIcons.userShield, Colors.red),
                Divider(thickness: 3,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int count, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6,
      child: ListTile(
        leading: Icon(icon, size: 40, color: color),
        title: Text(title, style: TextStyle(fontSize: 22, fontFamily: 'nexaheavy')),
        trailing: Text('$count', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }
}