import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StudentProfilePage extends StatefulWidget {
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  String? teacherBranch;

  @override
  void initState() {
    super.initState();
    fetchTeacherBranch();
  }

  Future<void> fetchTeacherBranch() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
      await FirebaseFirestore.instance.collection("users").doc(user.uid).get();

      if (userData.exists) {
        setState(() {
          teacherBranch = userData["branch"];
        });
      }
    }
  }

  Stream<QuerySnapshot> fetchStudents() {
    if (teacherBranch == null) {
      return const Stream.empty();
    }
    return FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "student")
        .where("branch", isEqualTo: teacherBranch)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profiles", style: TextStyle(fontFamily: 'nexaheavy', color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: teacherBranch == null
          ? Center(
        child: SpinKitWave(color: Colors.indigo), // ✅ Only One Loader
      )
          : StreamBuilder<QuerySnapshot>(
        stream: fetchStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitWave(color: Colors.indigo), // ✅ Only One Loader
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No students found in this branch",
                style: TextStyle(fontSize: 18, fontFamily: 'nexalight'),
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage('assets/images/profile.png'), // ✅ Default Profile Image
                  ),
                  title: Text(
                    doc["name"],
                    style: TextStyle(fontSize: 18, fontFamily: 'nexaheavy'),
                  ),
                  subtitle: Text(
                    "Branch: ${doc["branch"]}",
                    style: TextStyle(fontSize: 14, fontFamily: 'nexalight'),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
