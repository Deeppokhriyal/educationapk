import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPolyChatPage extends StatelessWidget {
  const AdminPolyChatPage({Key? key}) : super(key: key);

  Future<void> deleteMessage(String messageId) async {
    await FirebaseFirestore.instance.collection('global_chat').doc(messageId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Chat (Admin View)",
            style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20, color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('global_chat')
            .orderBy('timestamp', descending: true) // Show latest messages first
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text("No messages found",
                    style: TextStyle(fontFamily: 'nexalight', fontSize: 18)));
          }

          var messages = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              var messageData = messages[index].data() as Map<String, dynamic>;
              String messageId = messages[index].id;
              String messageText = messageData['message'] ?? "No content";
              String senderName = messageData['senderName'] ?? "Unknown";
              Timestamp timestamp = messageData['timestamp'] ?? Timestamp.now();

              return Card(
                margin: EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 5,
                child: ListTile(
                  title: Text(senderName,
                      style: TextStyle(fontFamily: 'nexaheavy', fontSize: 16, color: Colors.indigo)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(messageText,
                          style: TextStyle(fontFamily: 'nexalight', fontSize: 16)),
                      SizedBox(height: 4),
                      Text(timestamp.toDate().toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await deleteMessage(messageId);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Message deleted successfully!")),
                      );
                    },
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
