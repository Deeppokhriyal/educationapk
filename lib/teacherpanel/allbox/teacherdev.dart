import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Teacherdev extends StatelessWidget {
  final String url = "https://celestial-deepak.vercel.app/";

  void _launchURL() async {
    final Uri uri = Uri.parse("https://celestial-deepak.vercel.app/");

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView(
              children: [
                Stack(
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

                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child:Image.asset('assets/images/mylogobg.png'),
                          ),
                          SizedBox(height: 30,),
                          Container( padding: EdgeInsets.all(10),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dear Users -',style: TextStyle(fontFamily: 'nexalight',fontSize: 23,color: Colors.lightBlueAccent ),),
                                SizedBox(height: 15,),
                                Text('Welcome you to our application! ,We are excited to have you here! '
                                    '\nDeveloped by Team Celestial \nour application is built using the Flutter framework and Dart programming language to provide you with a seamless and enjoyable experience.'
                                    ' \n\nThank you for choosing us!',style: TextStyle(fontFamily: 'nexalight',fontSize: 15,color: Colors.white ),),
                                SizedBox(height: 20,),
                                Divider(),
                                SizedBox(height: 10,),
                                Image.asset('assets/images/devlogo.png'),
                                SizedBox(height: 10,),
                                Divider(),
                                SizedBox(height: 20,),
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/deeppro.png',height: 70,),
                                      SizedBox(width: 30,),
                                      Text('Deepak Pokhriyal',style: TextStyle(fontFamily: 'nexalight',fontSize: 25,color: Colors.lightBlueAccent),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                RichText(text:  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:"Hello, I'm Deepak Pokhriyal, currently pursuing a diploma in Information Technology 6th Semester. "
                                            "As a member of the Celestial Group, my technical expertise is split between ", style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'frontend (55%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'and ', style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'backend (45%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: "development. "
                                            "My programming skills encompass HTML, Dart, CSS, JavaScript, Kotlin, and Java. Furthermore,"
                                            " I have hands-on experience with Flutter for frontend development and Firebase and MySQL for backend development.",
                                        style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                    ]
                                )
                                ),
                                SizedBox(height: 30),
                                Container(
                                  child: Row(
                                    children: [
                                      Text('Shivanshi Mishra',style: TextStyle(fontFamily: 'nexalight',fontSize: 25,color: Colors.lightBlueAccent),),
                                      SizedBox(width: 30,),
                                      Image.asset('assets/images/shivipro-modified.png',height: 70,),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                RichText(text:
                                TextSpan(
                                    children: [
                                      TextSpan(
                                        text:"Hello, I'm Shivanshi Mishra, currently pursuing a diploma in Information Technology 6th Semester. "
                                            "As a member of the Celestial Group, my technical expertise is split between ", style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'frontend (45%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'and ', style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'backend (55%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: "development. "
                                            "My programming skills encompass HTML, Dart, CSS, JavaScript, Kotlin, and Java. Furthermore,"
                                            " I have hands-on experience with Flutter for frontend development and Firebase and MySQL for backend development.",
                                        style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                    ]
                                )
                                ),
                                SizedBox(height: 10,),
                                Divider(),
                                Row(
                                  children: [
                                    Text(' Developer\'s Profile : ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,letterSpacing: 1,wordSpacing: 1),),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: _launchURL,
                                      child: Image.asset('assets/images/tap1.png',height: 10,width: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Container(
                                  alignment: Alignment.center,
                                  child:
                                  Text('Contributes',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 23,color: Colors.lightBlueAccent),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}