import 'package:flutter/material.dart';

class Eventpage extends StatelessWidget {
  final Map<String, String> eventDetails = {
    'name': 'Tech Fest 2025',
    'date': '25th March 2025',
    'time': '10:00 AM - 5:00 PM',
    'venue': 'Main Auditorium, ABC College',
    'description': 'Join us for the biggest college tech fest with workshops, competitions, and guest lectures.',
    'image': 'https://example.com/event_banner.png',
    'registerLink': 'https://example.com/register',
  };

  final List<String> imageUrls = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
    'https://example.com/image4.jpg',
    'https://example.com/image5.jpg',
    'https://example.com/image6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          title: Text('Event Details',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25),)
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(eventDetails['image']!, fit: BoxFit.cover, width: double.infinity, height: 200),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(eventDetails['name']!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.blueAccent),
                    SizedBox(width: 5),
                    Text('${eventDetails['date']} | ${eventDetails['time']}'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.redAccent),
                    SizedBox(width: 5),
                    Text(eventDetails['venue']!),
                  ],
                ),
                SizedBox(height: 15),
                Text('About Event', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(eventDetails['description']!),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Open Registration Link
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('Register Now', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                Text('Event Gallery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImage(imageUrl: imageUrls[index]),
                          ),
                        );
                      },
                      child: Hero(
                        tag: imageUrls[index],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageUrls[index], fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Eventpage(),
  ));
}

