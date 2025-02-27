import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../bottombar/homepage.dart';

class LeaveApplicationsList extends StatefulWidget {
  @override
  _LeaveApplicationsListState createState() => _LeaveApplicationsListState();
}

class _LeaveApplicationsListState extends State<LeaveApplicationsList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                        'https://img.freepik.com/free-vector/abstract-colorful-low-poly-triangle-shapes_361591-4154.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                    fit: BoxFit.cover),
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
                              )),
                          Text(
                            'No Application\'s Available',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: 'nexaheavy'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Currently, there are no application\'s in the teacher application panel.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'nexalight'),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(TeacherHome());
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.white, // Text color
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Explore more Feature\'s',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: 'nexaheavy',
                                      fontSize: 17),
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

                      return Card(
                        color: Colors.white70,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: ListTile(
                          title: Text(
                            "Submitted By: ${data['submitBy']}",
                            style: TextStyle(
                                fontFamily: 'nexaheavy',
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Leave Date: ${data['leaveDate']}",
                                  style: TextStyle(
                                      fontFamily: 'nexalight',
                                      color: Colors.lightBlueAccent,
                                      fontSize: 16)),
                              Text("Reason: ${data['leaveReason']}",
                                  style: TextStyle(
                                      fontFamily: 'nexalight',
                                      color: Colors.lightBlueAccent,
                                      fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        )
    );
  }
}
