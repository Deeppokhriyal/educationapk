import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/allpages/AttendancePage/Elec/attendanceelec.dart';
import 'package:educationapk/allpages/AttendancePage/agri/attendanceagri.dart';
import 'package:educationapk/allpages/AttendancePage/chem/attendancechem.dart';
import 'package:educationapk/allpages/AttendancePage/civil/attendancecivil.dart';
import 'package:educationapk/allpages/AttendancePage/cs/attendancecs.dart';
import 'package:educationapk/allpages/AttendancePage/it/attendancepage.dart';
import 'package:educationapk/allpages/AttendancePage/mech/attendancemech.dart';
import 'package:educationapk/allpages/AttendancePage/paint/attendancepaint.dart';
import 'package:educationapk/allpages/AttendancePage/pharmacy/attendancepharmacy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

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
    } else if (userBranch == "AGRICULTURE") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Attendanceagri()));
    } else if (userBranch == "MECH") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Attendancemech()));
    } else if (userBranch == "PAINT") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Attendancepaint()));
    } else if (userBranch == "ELEX") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Attendanceelec()));
    } else if (userBranch == "CHEMICAL") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Attendancechem()));
    } else if (userBranch == "CIVIL") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Attendancecivil()));
    } else if (userBranch == "PHARMACY") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Attendancepharmacy()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Branch not assigned!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text("Branch Navigation",style: TextStyle(fontFamily: 'nexaheavy'),)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Today's Date: $today", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20)),
          SizedBox(height: 30,),
          Center(
            child: userBranch == null
                ? SpinKitWave(
              color: Colors.lightBlue,
              size: 35,
            ) // 🔄 Jab tak data fetch ho raha hai
                : ElevatedButton(
              onPressed: navigateToAttendance,
              child: BounceIn(
                  duration: Duration(milliseconds: 800),
                  child: Text("Go to $userBranch Attendance",style: TextStyle(fontFamily: 'nexalight',fontSize: 22,color: Colors.lightBlue),)),
            ),
          ),
        ],
      ),
    );
  }
}
