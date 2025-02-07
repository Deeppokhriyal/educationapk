import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Devpage extends StatelessWidget {
  const Devpage({super.key});

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
                          image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
                          fit: BoxFit.cover,
                        ),
                      ),

                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 50),
                            child:Image.asset('assets/images/mylogobg.png'),
                          ),
                          SizedBox(height: 30,),
                          Container( padding: EdgeInsets.all(20),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dear Users -',style: TextStyle(fontFamily: 'nexalight',fontSize: 23,color: Colors.lightBlueAccent ),),
                                SizedBox(height: 25,),
                                Text('Welcome you to our application! ,We are excited to have you here! '
                                    '\nDeveloped by Team Celestial \nour application is built using the Flutter framework and Dart programming language to provide you with a seamless and enjoyable experience.'
                                    ' \n\nThank you for choosing us!',style: TextStyle(fontFamily: 'nexalight',fontSize: 15,color: Colors.white ),),
                                SizedBox(height: 50,),
                                Divider(),
                                SizedBox(height: 16,),
                                Image.asset('assets/images/devlogo.png'),
                                SizedBox(height: 16,),
                                Divider(),
                                SizedBox(height: 50,),
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/deeppro.png',height: 70,),
                                      SizedBox(width: 60,),
                                      Text('Deepak Pokhriyal',style: TextStyle(fontFamily: 'nexalight',fontSize: 25,color: Colors.lightBlueAccent),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 35,),
                                RichText(text:  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:"Hello, I'm Deepak Pokhriyal, currently pursuing a diploma in Information Technology 6th Semester. "
                                            "As a member of the Celestial Group, my technical expertise is split between ", style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'frontend (55%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 16,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'and ', style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'backend (45%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 16,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: "development. "
                                            "My programming skills encompass HTML, Dart, CSS, JavaScript, Kotlin, and Java. Furthermore,"
                                            " I have hands-on experience with Flutter for frontend development and Firebase and MySQL for backend development.",
                                        style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                    ]
                                )
                                ),
                                SizedBox(height: 70),
                                Container(
                                  child: Row(
                                    children: [
                                      Text('Shivanshi Mishra',style: TextStyle(fontFamily: 'nexalight',fontSize: 25,color: Colors.lightBlueAccent),),
                                      SizedBox(width: 65,),
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
                                            "As a member of the Celestial Group, my technical expertise is split between ", style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'frontend (45%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 16,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'and ', style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: 'backend (55%) ', style: TextStyle(fontFamily: 'nexaheavy',fontSize: 16,color: Colors.green.shade400,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                      TextSpan(
                                        text: "development. "
                                            "My programming skills encompass HTML, Dart, CSS, JavaScript, Kotlin, and Java. Furthermore,"
                                            " I have hands-on experience with Flutter for frontend development and Firebase and MySQL for backend development.",
                                        style: TextStyle(fontFamily: 'nexalight',fontSize: 16,color: Colors.white,letterSpacing: 1,wordSpacing: 1),
                                      ),
                                    ]
                                )
                                ),
                                SizedBox(height: 10,),
                                Divider(),
                                Row(
                                  children: [
                                    Text(' Developer\'s Profile : ', style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.greenAccent,letterSpacing: 1,wordSpacing: 1),),
                                    GestureDetector(
                                      onTap: () => _launchURL('https://www.youtube.com/'),
                                      child: Icon(
                                        Icons.link, // Use any icon you prefer
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ),

                                  ],
                                ),
                                Divider(),
                                Container(
                                  alignment: Alignment.center,
                                  child:
                                  Text('Contributes',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
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

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch $url';
  }
}
