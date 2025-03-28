import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart'; // For time formatting

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      _firestore.collection('messages').add({
        'text': messageController.text.trim(),
        'sender': _auth.currentUser?.email ?? "Unknown",
        'timestamp': FieldValue.serverTimestamp(),
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Global Chat",
          style: TextStyle(fontFamily: 'nexaheavy', fontSize: 24),
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
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: SpinKitFadingCircle(
                      color: Colors.lightBlueAccent,
                      size: 50,
                    ));
                  }

                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var message = snapshot.data!.docs[index];
                      bool isMe = _auth.currentUser?.email == message['sender'];

                      return Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.lightBlueAccent : Colors.white,
                            borderRadius: BorderRadius.circular(20),
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
                                  fontSize: 13,
                                  color: isMe ? Colors.white70 : Colors.black54,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                message['text'],
                                style: TextStyle(
                                  fontFamily: 'nexalight',
                                  fontSize: 16,
                                  color: isMe ? Colors.white : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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