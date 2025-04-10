import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StudentAssignment extends StatefulWidget {
  @override
  _StudentAssignmentState createState() => _StudentAssignmentState();
}

class _StudentAssignmentState extends State<StudentAssignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Assignments",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'nexaheavy'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('assignments') // Fetching all assignments
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: SpinKitSquareCircle(color: Colors.purpleAccent[100]));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildNoAssignmentUI();
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var assignment = snapshot.data!.docs[index];
              List<dynamic> questions = assignment['questions'] ?? [];
              String branch = assignment['branch'] ?? 'Unknown Branch'; // Fetching branch name

              return Card(
                color: Colors.grey.shade100,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        assignment['subject'],
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'nexaheavy'),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Branch: $branch", // Displaying branch name
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'nexaheavy', color: Colors.blue),
                      ),
                      SizedBox(height: 5),
                      Text(
                        assignment['description'],
                        style: TextStyle(fontSize: 17, fontFamily: 'nexalight'),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Deadline: ${assignment['deadline']}",
                        style: TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'nexaheavy'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Questions:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'nexalight', fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: questions
                            .map((q) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text("• $q", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 16)),
                        ))
                            .toList(),
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

  Widget _buildNoAssignmentUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.my_library_books, size: 190, color: Colors.purpleAccent[100]),
          Text(
            "No Assignments Available",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'nexaheavy',
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Currently, there are no assignments assigned.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 25,
              fontFamily: 'nexalight',
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
