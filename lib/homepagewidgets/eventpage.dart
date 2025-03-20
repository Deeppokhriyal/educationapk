import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
              Get.to(()=>Holidays());
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

class Holidays extends StatelessWidget {
  const Holidays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
        title: Text('2025 Holiday\'s',style: TextStyle(fontFamily: 'nexaheavy'))
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Divider(thickness: 3,color: Colors.black,),
          Text('Gazetted Holidays -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25),),
          SizedBox(height: 10,),
          Text('1. 26 January 2025: Republic Day (Rashtriya Din)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('2. 26 February 2025: Maha Shivaratri (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('3. 14 March 2025: Holi (National, except southern states)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('4. 31 March 2025: Id-ul-Fitr (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('5. 18 April 2025: Good Friday (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('6. 10 April 2025: Mahavir Jayanti (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('7. 12 May 2025: Buddha Purnima (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('8. 7 June 2025: Id-ul-Zuha (Bakrid) (National, except Sikkim)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('9. 6 July 2025: Muharram (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('10. 15 August 2025: Independence Day (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('11. 16 August 2025: Janmashtami (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('12. 5 September 2025: Id-e-Milad (Birthday of Prophet Mohammad) (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('13. 2 October 2025: Mahatma Gandhi\'s Birthday (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('14. 20 October 2025: Diwali/Deepavali (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('15. 5 November 2025: Guru Nanak\'s Birthday (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('16. 25 December 2025: Christmas Day (National)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('Restricted Holidays -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25),),
          SizedBox(height: 10,),
          Text('1. 1 January 2025: New Year\'s Day',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('2. 6 January 2025: Guru Gobind Singh\'s Birthday',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('3. 14 January 2025: Makar Sankranti',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('4. 2 February 2025: Basant Panchami',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('5. 12 February 2025: Guru Ravidas Birthday',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('6. 13 March 2025: Holika Dahan',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('7. 28 March 2025: Jamat-Ul-Vida',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          SizedBox(height: 10,),
          Text('8. 30 March 2025: Chaitra Sukladi/Gudi Padava',style: TextStyle(fontFamily: 'nexalight',fontSize: 18),),
          ],
      )
    );
  }
}


