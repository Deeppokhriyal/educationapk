import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/Computerscience/cstab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/agriculture/agritab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/chemical/chemtab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/civil/civiltab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/electronics/elex.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/informationtech/ittab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/mechanical/mechtab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/paint/painttab.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/pharmacy/pharmacytab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

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

      // String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

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
    } else if (userBranch == "MECH") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Mechtab()));
    } else if (userBranch == "CIVIL") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Civiltab()));
    } else if (userBranch == "CHEMICAL") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Chemtab()));
    } else if (userBranch == "PAINT") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Painttab()));
    } else if (userBranch == "AGRICULTURE") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Agritab()));
    } else if (userBranch == "PHARMACY") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Pharmacytab()));
    } else if (userBranch == "ELEX") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Elextab()));
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
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Branch Navigation",style: TextStyle(fontFamily: 'nexaheavy' ),),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                :ElevatedButton(
              onPressed: navigateToAttendance,
              child: Text("Go to $userBranch Attendance",style: TextStyle(fontFamily: 'nexalight',fontSize: 22,color: Colors.lightBlue  ),),
            ),
          ),
        ],
      ),
    );
  }
}

