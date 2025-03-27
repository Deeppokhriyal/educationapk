import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentAssignment extends StatelessWidget {
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('assignments').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildNoAssignmentUI(); // Fixed function call
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var assignment = snapshot.data!.docs[index];
              List<dynamic> questions = assignment['questions'] ?? [];

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

  // Fixed function placement
  Widget _buildNoAssignmentUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 160,
            child: Image.network(
              'https://img.icons8.com/?size=128&id=48162&format=png',
              fit: BoxFit.cover,
            ),
          ),
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
