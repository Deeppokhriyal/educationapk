import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminApplicationsPage extends StatefulWidget {
  @override
  _AdminApplicationsPageState createState() => _AdminApplicationsPageState();
}

class _AdminApplicationsPageState extends State<AdminApplicationsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void updateApplicationStatus(String docId, String status) {
    _firestore.collection('leave_applications').doc(docId).update({'status': status});
  }

  void deleteApplication(String docId) {
    _firestore.collection('leave_applications').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leave Applications",
          style: TextStyle(fontFamily: 'nexaheavy', fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder(
        stream: _firestore.collection('leave_applications').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No leave applications found"));
          }

          var applications = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: applications.length,
            itemBuilder: (context, index) {
              var application = applications[index].data() as Map<String, dynamic>;
              String docId = applications[index].id;
              String submitName = application['submitName'] ?? "N/A";
              String rollNo = application['rollno'] ?? "N/A";
              String leaveDate = application['leaveDate'] ?? "N/A";
              String leaveReason = application['leaveReason'] ?? "N/A";
              String branch = application['branch'] ?? "Unknown Branch";
              String status = application['status'] ?? "Pending";

              return Card(
                elevation: 5,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: $submitName",
                        style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20, color: Colors.indigo),
                      ),
                      SizedBox(height: 5),
                      Text("Roll No: $rollNo", style: TextStyle(fontFamily: 'nexalight', fontSize: 16)),
                      SizedBox(height: 5),
                      Text("Branch: $branch", style: TextStyle(fontFamily: 'nexalight', fontSize: 16)),
                      SizedBox(height: 5),
                      Text("Leave Date: $leaveDate", style: TextStyle(fontFamily: 'nexalight', fontSize: 16, color: Colors.red)),
                      SizedBox(height: 10),
                      Text("Reason: $leaveReason", style: TextStyle(fontFamily: 'nexalight', fontSize: 16)),
                      SizedBox(height: 10),
                      Text("Status: $status", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 18, color: status == "Approved" ? Colors.green : status == "Declined" ? Colors.red : Colors.orange)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => updateApplicationStatus(docId, "Approved"),
                            child: Text("Approve", style: TextStyle(fontFamily: 'nexaheavy')),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          ),
                          ElevatedButton(
                            onPressed: () => updateApplicationStatus(docId, "Declined"),
                            child: Text("Decline", style: TextStyle(fontFamily: 'nexaheavy')),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.grey),
                            onPressed: () => deleteApplication(docId),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
