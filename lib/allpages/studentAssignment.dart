import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assignments")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('assignments').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No assignments available"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var assignment = snapshot.data!.docs[index];
              List<dynamic> questions = assignment['questions'] ?? [];

              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(assignment['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(assignment['description'], style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text("Deadline: ${assignment['deadline']}", style: TextStyle(color: Colors.red)),
                      SizedBox(height: 10),
                      Text("Questions:", style: TextStyle(fontWeight: FontWeight.bold)),
                      ...questions.map((q) => Text("• $q")).toList(),
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
