import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  Map<String, List<QueryDocumentSnapshot>> groupMessagesByDate(List<QueryDocumentSnapshot> messages) {
    Map<String, List<QueryDocumentSnapshot>> groupedMessages = {};

    for (var message in messages) {
      // Check if timestamp exists and is not null
      Timestamp? timestamp = message['timestamp'] as Timestamp?;

      if (timestamp != null) {
        DateTime date = timestamp.toDate();
        String formattedDate = "${date.day}-${date.month}-${date.year}";

        if (groupedMessages[formattedDate] == null) {
          groupedMessages[formattedDate] = [];
        }
        groupedMessages[formattedDate]!.add(message);
      }
    }

    return groupedMessages;
  }



  TextEditingController messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      _firestore.collection('messages').add({
        'text': messageController.text.trim(),
        'sender': _auth.currentUser?.email ?? "Unknown",
        'timestamp': FieldValue.serverTimestamp(), // Ensure timestamp is set
      });
      messageController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "PolyChat",
              style: TextStyle(fontFamily: 'nexaheavy', fontSize: 24),
            ),
            SizedBox(width: 5,),
            Icon(Icons.language_outlined,size: 35,)
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.lightBlue.shade100],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: StreamBuilder(
                stream: _firestore
                    .collection('messages')
                    .orderBy('timestamp', descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: SpinKitFadingCircle(
                      color: Colors.lightBlueAccent,
                      size: 50,
                    ));
                  }

                  return ListView(
                    reverse: false,
                    children: groupMessagesByDate(snapshot.data!.docs).entries.map((entry) {
                      String date = entry.key;
                      List<QueryDocumentSnapshot> messages = entry.value;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date Header
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                            alignment: Alignment.center,
                            child: Text(
                              date,
                              style: TextStyle(
                                fontFamily: 'nexaheavy',
                                fontSize: 15,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),

                          // Messages of this Date
                          ...messages.map((message) {
                            bool isMe = _auth.currentUser?.email == message['sender'];
                            DateTime messageTime = (message['timestamp'] as Timestamp).toDate();

                            return Align(
                              alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                                ),
                                margin: EdgeInsets.only(
                                  top: 6,
                                  bottom: 6,
                                  left: isMe ? 50 : 10, // Space between messages
                                  right: isMe ? 10 : 50, // Space between messages
                                ),
                                decoration: BoxDecoration(
                                  color: isMe ? Colors.lightBlueAccent : Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(isMe ? 20 : 0),
                                    bottomRight: Radius.circular(isMe ? 0 : 20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black26, blurRadius: 7),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message['sender'],
                                      style: TextStyle(
                                        fontFamily: 'nexaheavy',
                                        fontSize: 16,
                                        color: isMe ? Colors.white70 : Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      message['text'],
                                      style: TextStyle(
                                        fontFamily: 'nexalight',
                                        fontSize: 19,
                                        color: isMe ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${messageTime.hour}:${messageTime.minute.toString().padLeft(2, '0')}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    cursorColor: Colors.lightBlue, // Set cursor color to light blue
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(fontFamily: 'nexalight', fontSize: 17, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.lightBlue), // Default border color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.black), // Non-focused border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.lightBlue, width: 2.0), // Light blue border when tapped
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),

                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 27, // Make the CircleAvatar bigger
                  backgroundColor: Colors.lightBlueAccent,
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white, size: 32), // Increase icon size
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}