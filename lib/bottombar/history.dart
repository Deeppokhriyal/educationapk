import'package:flutter/material.dart';

class ApplicationHistory extends StatefulWidget {
  const ApplicationHistory({super.key});

  @override
  State<ApplicationHistory> createState() => _ApplicationHistoryState();
}

class _ApplicationHistoryState extends State<ApplicationHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/abstract-gradient-neon-lights_23-2149279124.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_authors_boost'), // Path to your background image
                // image: NetworkImage('https://img.freepik.com/premium-photo/tiles-art-illustration_732004-8.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'),// Path to your background image
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 30,top: 40),
                        child: Text(' Application History',style: TextStyle(fontSize: 25,fontFamily: 'nexalight',color: Colors.white),)),
                    Divider(),
                    SizedBox(height: 150,),
                    Text('There\'s no Application in your History',style: TextStyle(fontSize: 25,fontFamily: 'nexalight',color: Colors.white),),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}
