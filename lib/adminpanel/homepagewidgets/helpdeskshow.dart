import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHelpDeskPage extends StatefulWidget {
  @override
  _AdminHelpDeskPageState createState() => _AdminHelpDeskPageState();
}

class _AdminHelpDeskPageState extends State<AdminHelpDeskPage> {
  final TextEditingController _replyController = TextEditingController();

  Future<void> _submitReply(String docId) async {
    if (_replyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a reply")),
      );
      return;
    }
    try {
      await FirebaseFirestore.instance
          .collection('help_desk_queries')
          .doc(docId)
          .update({'reply': _replyController.text});
      _replyController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to submit reply")),
      );
    }
  }

  Future<void> _deleteQuery(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('help_desk_queries').doc(docId).delete();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete query")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Desk Queries',style: TextStyle(fontFamily: 'nexaheavy',),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black45,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('help_desk_queries').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No queries available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var query = snapshot.data!.docs[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Q: ${query['query']}",
                        style: TextStyle(fontFamily: 'NexaHeavy', fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "A: ${query['reply'].isNotEmpty ? query['reply'] : 'No reply yet'}",
                        style: TextStyle(
                          fontFamily: 'NexaLight',
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      if (query['reply'].isEmpty) ...[
                        TextField(
                          controller: _replyController,
                          decoration: InputDecoration(
                            hintText: "Enter reply",
                            hintStyle: TextStyle(
                              fontFamily: 'nexaheavy',
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () => _submitReply(query.id),
                          child: Text("Submit Reply",style: TextStyle(
                            fontFamily: 'nexaheavy',
                          ),),
                        ),
                      ],
                      SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () => _deleteQuery(query.id),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text("Delete Query", style: TextStyle(fontFamily: 'nexaheavy',color: Colors.white)),
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