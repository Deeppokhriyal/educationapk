import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For formatting timestamp

class AdminPolyChatPage extends StatelessWidget {
  const AdminPolyChatPage({Key? key}) : super(key: key);

  Future<void> deleteMessage(String messageId) async {
    try {
      await FirebaseFirestore.instance.collection('messages').doc(messageId).delete();
      print("Message deleted: $messageId");
    } catch (e) {
      print("Error deleting message: $e");
    }
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
            .collection('messages')
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
          print("Fetched ${messages.length} messages from Firestore");

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              var messageData = messages[index].data() as Map<String, dynamic>?;
              if (messageData == null) return SizedBox(); // Prevent crash if null

              String messageId = messages[index].id;
              String messageText = messageData['text'] ?? "No content";
              String senderName = messageData['sender'] ?? "Unknown";
              Timestamp? timestamp = messageData['timestamp'];
              String formattedTime = timestamp != null
                  ? DateFormat('dd MMM yyyy, hh:mm a').format(timestamp.toDate())
                  : "Unknown Time";

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
                      Text(formattedTime, style: TextStyle(fontSize: 12, color: Colors.grey)),
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
