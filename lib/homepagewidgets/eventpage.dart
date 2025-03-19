import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('events').orderBy('createdAt', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No events available"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var event = snapshot.data!.docs[index];
              return EventCard(
                eventName: event['eventName'],
                startDate: event['startDate'],
                endDate: event['endDate'],
                description: event['description'],
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(

            onPressed: (){

            },
            child: Text("2025 Holiday\'s'",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 19,color: Colors.blue),),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String eventName, startDate, endDate, description;

  const EventCard({
    Key? key,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
            ),
            const SizedBox(height: 5),
            Text("📅 Start Date: $startDate", style: const TextStyle(fontSize: 16)),
            Text("📅 End Date: $endDate", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

