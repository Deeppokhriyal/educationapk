import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAssignmentPage extends StatefulWidget {
  @override
  _AdminAssignmentPageState createState() => _AdminAssignmentPageState();
}

class _AdminAssignmentPageState extends State<AdminAssignmentPage> {

  void deleteAssignment(String docId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Assignment"),
        content: Text("Are you sure you want to delete this assignment?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('assignments').doc(docId).delete();
              Navigator.pop(context);
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<String> getTeacherName(String teacherId) async {
    try {
      DocumentSnapshot teacherDoc = await FirebaseFirestore.instance.collection('users').doc(teacherId).get();
      if (teacherDoc.exists) {
        var teacherData = teacherDoc.data() as Map<String, dynamic>;
        return teacherData['name'] ?? 'Unknown Teacher';
      }
    } catch (e) {
      print("Error fetching teacher data: $e");
    }
    return 'Unknown Teacher';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assignments Overview",
          style: TextStyle(fontFamily: 'nexaheavy', fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('assignments').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No assignments found"));
          }

          var assignments = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              var assignment = assignments[index].data() as Map<String, dynamic>;
              String docId = assignments[index].id;
              String subject = assignment['subject'] ?? "N/A";
              String description = assignment['description'] ?? "N/A";
              String deadline = assignment['deadline'] ?? "N/A";
              String teacherId = assignment['teacherId'] ?? ""; // Teacher UID
              List<dynamic> questions = assignment['questions'] ?? [];

              return FutureBuilder<String>(
                future: getTeacherName(teacherId),
                builder: (context, teacherSnapshot) {
                  String teacherName = teacherSnapshot.data ?? "Unknown Teacher";
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
                            subject,
                            style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20, color: Colors.indigo),
                          ),
                          SizedBox(height: 5),
                          Text("Teacher: $teacherName", style: TextStyle(fontFamily: 'nexalight', fontSize: 16)),
                          SizedBox(height: 5),
                          Text("Deadline: $deadline", style: TextStyle(fontFamily: 'nexalight', fontSize: 16, color: Colors.red)),
                          SizedBox(height: 10),
                          Text("Description: $description", style: TextStyle(fontFamily: 'nexalight', fontSize: 16)),
                          SizedBox(height: 10),
                          if (questions.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: questions.map((q) => Text("Q : $q", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 18))).toList(),
                            ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteAssignment(docId),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
