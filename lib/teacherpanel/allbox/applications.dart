import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LeaveApplicationsList extends StatefulWidget {
  @override
  _LeaveApplicationsListState createState() => _LeaveApplicationsListState();
}

class _LeaveApplicationsListState extends State<LeaveApplicationsList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? teacherBranch;
  bool isLoading = true;
  List<Map<String, dynamic>> filteredApplications = [];

  @override
  void initState() {
    super.initState();
    fetchTeacherBranch();
  }

  Future<void> fetchTeacherBranch() async {
    try {
      String teacherId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot teacherDoc =
      await _firestore.collection('teachers').doc(teacherId).get();

      if (teacherDoc.exists && teacherDoc.data() != null) {
        teacherBranch = teacherDoc['branch'];
        await fetchLeaveApplications(); // Fetch applications after getting branch
      } else {
        print("No branch found for teacher!");
      }
    } catch (e) {
      print("Error fetching teacher branch: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchLeaveApplications() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('leave_applications')
          .orderBy('submittedAt', descending: true)
          .get();

      // Manually filter applications based on teacherBranch
      List<Map<String, dynamic>> allApplications = snapshot.docs
          .map((doc) => {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      })
          .toList();

      setState(() {
        filteredApplications = allApplications
            .where((app) => app['branch'] == teacherBranch)
            .toList();
      });
    } catch (e) {
      print("Error fetching applications: $e");
    }
  }

  Future<void> updateLeaveStatus(String docId, String status) async {
    await _firestore.collection('leave_applications').doc(docId).update({
      'status': status,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Application marked as $status")),
    );

    // Update UI after changing status
    setState(() {
      filteredApplications = filteredApplications.map((app) {
        if (app['id'] == docId) {
          return {...app, 'status': status};
        }
        return app;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Leave Applications"),
        backgroundColor: Colors.white,),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : filteredApplications.isEmpty
          ? _buildNoApplicationsUI()
          : ListView.builder(
        itemCount: filteredApplications.length,
        itemBuilder: (context, index) {
          var data = filteredApplications[index];
          String docId = data['id'];
          String currentStatus = data['status'] ?? 'Pending';

          return Card(
            color: Colors.white70,
            margin:
            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              title: Text(
                "Submitted By: ${data['submitName']}",
                style: TextStyle(
                  fontFamily: 'nexaheavy',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reason : ${data['leaveReason']}",
                    style: TextStyle(
                      fontFamily: 'nexalight',
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    "Leave Date : ${data['leaveDate']}",
                    style: TextStyle(
                      fontFamily: 'nexalight',
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            updateLeaveStatus(docId, "Approved"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text(
                          "Approve",
                          style: TextStyle(color: Colors.white,fontFamily: 'nexaheavy',fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () =>
                            updateLeaveStatus(docId, "Declined"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text(
                          "Decline",
                          style: TextStyle(color: Colors.white,fontFamily: 'nexaheavy',fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Status: $currentStatus",
                    style: TextStyle(
                      fontFamily: 'nexaheavy',
                      fontSize: 18,
                      color: currentStatus == "Approved"
                          ? Colors.green
                          : currentStatus == "Declined"
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoApplicationsUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 160,
            child: Image.network(
              'https://img.icons8.com/?size=128&id=48162&format=png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "No Applications Available",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'nexaheavy',
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Currently, there are no leave applications.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 20,
              fontFamily: 'nexalight',
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}