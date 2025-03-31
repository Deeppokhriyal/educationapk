import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAttendancePage extends StatefulWidget {
  @override
  _AdminAttendancePageState createState() => _AdminAttendancePageState();
}

class _AdminAttendancePageState extends State<AdminAttendancePage> {
  Future<int> fetchTotalStudents() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Mechfirst').get();
    return snapshot.docs.length; // Total number of students
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Overview')),
      body: Center(
        child: FutureBuilder<int>(
          future: fetchTotalStudents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error fetching data');
            } else {
              return Text('Total Students in Mechfirst: ${snapshot.data}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
            }
          },
        ),
      ),
    );
  }
}
