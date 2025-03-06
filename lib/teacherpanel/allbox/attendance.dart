import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/Computerscience/cstab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/informationtech/ittab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
          context, MaterialPageRoute(builder: (context) => Ittab()));
    } else if (userBranch == "CSE") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Cstab()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Branch not assigned!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Branch Navigation")),
      body: Center(
        child: userBranch == null
            ? CircularProgressIndicator() // 🔄 Jab tak data fetch ho raha hai
            : ElevatedButton(
          onPressed: navigateToAttendance,
          child: Text("Go to $userBranch Attendance"),
        ),
      ),
    );
  }
}
