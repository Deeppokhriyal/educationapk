import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottombar/teacherhome.dart';

class LeaveApplicationsList extends StatefulWidget {
  @override
  _LeaveApplicationsListState createState() => _LeaveApplicationsListState();
}

class _LeaveApplicationsListState extends State<LeaveApplicationsList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to update leave status
  Future<void> updateLeaveStatus(String docId, String status) async {
    await _firestore.collection('leave_applications').doc(docId).update({
      'status': status,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Application marked as $status")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leave Applications")),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(7, 30, 7, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/free-vector/abstract-colorful-low-poly-triangle-shapes_361591-4154.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('leave_applications')
                  .orderBy('submittedAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
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
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'nexalight',
                          ),
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(TeacherHome());
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Explore More Features",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontFamily: 'nexaheavy',
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                var leaveApplications = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: leaveApplications.length,
                  itemBuilder: (context, index) {
                    var data = leaveApplications[index].data()
                    as Map<String, dynamic>;
                    String docId = leaveApplications[index].id;
                    String currentStatus = data['status'] ?? 'Pending';

                    return Card(
                      color: Colors.white70,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ListTile(
                        title: Text(
                          "Submitted By: ${data['submitBy']}",
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
                              "Leave Date: ${data['leaveDate']}",
                              style: TextStyle(
                                fontFamily: 'nexalight',
                                color: Colors.lightBlueAccent,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Reason: ${data['leaveReason']}",
                              style: TextStyle(
                                fontFamily: 'nexalight',
                                color: Colors.lightBlueAccent,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () =>
                                      updateLeaveStatus(docId, "Approved"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: Text(
                                    "Approve",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () =>
                                      updateLeaveStatus(docId, "Declined"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    "Decline",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Status: $currentStatus",
                              style: TextStyle(
                                fontFamily: 'nexaheavy',
                                fontSize: 16,
                                color: currentStatus == "Approved"
                                    ? Colors.green
                                    : currentStatus == "Declined"
                                    ? Colors.red
                                    : Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
