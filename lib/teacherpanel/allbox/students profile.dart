import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentProfilePage extends StatefulWidget {
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  String teacherBranch = ""; // Teacher ki branch store karne ke liye

  @override
  void initState() {
    super.initState();
    fetchTeacherBranch(); // Teacher ki branch fetch karna
  }

  // ✅ Teacher ki Branch Firebase se Fetch karna
  Future<void> fetchTeacherBranch() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
      await FirebaseFirestore.instance.collection("users").doc(user.uid).get();

      if (userData.exists) {
        setState(() {
          teacherBranch = userData["branch"] ?? "";
        });
      }
    }
  }

  // ✅ Usi Branch Ke Students Fetch Karna
  Stream<QuerySnapshot> fetchStudents() {
    return FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "student") // Sirf students ko fetch karega
        .where("branch", isEqualTo: teacherBranch) // Teacher ki branch wale students
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profiles", style: TextStyle(fontFamily: 'nexaheavy')),
        backgroundColor: Colors.blueAccent,
      ),
      body: teacherBranch.isEmpty
          ? Center(child: CircularProgressIndicator()) // Jab tak branch load na ho tab tak loader dikhaye
          : StreamBuilder(
        stream: fetchStudents(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Data Load ho raha hai
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text(
                  "No students found in this branch",
                  style: TextStyle(fontSize: 18, fontFamily: 'nexalight'),
                ));
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: doc["profileImage"] != null &&
                        doc["profileImage"].toString().isNotEmpty
                        ? NetworkImage(doc["profileImage"])
                        : AssetImage('assets/images/profile.png')
                    as ImageProvider,
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
