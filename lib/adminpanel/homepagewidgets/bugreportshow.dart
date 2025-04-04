import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminBugReportsPage extends StatefulWidget {
  @override
  _AdminBugReportsPageState createState() => _AdminBugReportsPageState();
}

class _AdminBugReportsPageState extends State<AdminBugReportsPage> {
  Future<void> _deleteBugReport(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('bug_reports').doc(docId).delete();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete bug report", style: TextStyle(fontFamily: 'NexaLight'))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bug Reports', style: TextStyle(fontFamily: 'NexaHeavy',color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black45,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bug_reports').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No bug reports available', style: TextStyle(fontFamily: 'NexaLight')));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var bugReport = snapshot.data!.docs[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title: ${bugReport['title']}",
                        style: TextStyle(fontFamily: 'NexaHeavy', fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Description: ${bugReport['description']}",
                        style: TextStyle(
                          fontFamily: 'NexaLight',
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () => _deleteBugReport(bugReport.id),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text("Delete Report", style: TextStyle(color: Colors.white, fontFamily: 'NexaLight')),
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
