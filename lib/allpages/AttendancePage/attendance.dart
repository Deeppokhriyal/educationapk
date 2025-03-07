import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/allpages/AttendancePage/cs/attendancecs.dart';
import 'package:educationapk/allpages/AttendancePage/it/attendancepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AttendanceHistory extends StatefulWidget {
  @override
  _AttendanceHistoryState createState() => _AttendanceHistoryState();
}

class _AttendanceHistoryState extends State<AttendanceHistory> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? userBranch; // Teacher ki branch store karne ke liye

  @override
  void initState() {
    super.initState();
    getUserBranch(); // 🔥 Firestore se teacher ka branch fetch karne ka function
  }

  Future<void> getUserBranch() async {
    User? user = _auth.currentUser; // 🔥 Firebase se logged-in user ka UID le rahe hain

    if (user != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection("users").doc(user.uid).get();

      if (userDoc.exists) {
        setState(() {
          userBranch = userDoc["branch"]; // 🔥 Firestore se branch ka data le rahe hain
        });
      }
    }
  }

  // 🔥 Navigation function jo teacher ki branch ke according page open karega
  void navigateToAttendance() {
    if (userBranch == "IT") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AttendanceIT()));
    } else if (userBranch == "CSE") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AttendanceCSE()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Branch not assigned!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Branch Navigation",style: TextStyle(fontFamily: 'nexaheavy'),)),
      body: Center(
        child: userBranch == null
            ? CircularProgressIndicator() // 🔄 Jab tak data fetch ho raha hai
            : ElevatedButton(
          onPressed: navigateToAttendance,
          child: Text("Go to $userBranch Attendance",style: TextStyle(fontFamily: 'nexalight',fontSize: 22),),
        ),
      ),
    );
  }
}
