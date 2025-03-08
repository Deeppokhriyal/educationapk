import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AgSyllabus extends StatelessWidget {
  final List<Map<String, String>> links = [
    {"title": "Engineering Ist Year",
      "url": "https://drive.google.com/file/d/1bCgIcKi6WNbZIgu2QcxCmLJjkGZULUoQ/view?usp=drive_link"},
    {"title": "Agriculture Engineering-III Sem",
      "url": "https://drive.google.com/file/d/1jUG3EPcGCJjaOLWs2Db5Y7BvT9W6ZJCX/view?usp=drive_link"},
    {"title": "Agriculture Engineering-IV Sem",
      "url" : "https://drive.google.com/file/d/1ARAtT8tXakasPwqPmIDLFDi21PnwGujI/view?usp=drive_link"},
    {"title": "Agriculture Engineering-V Sem",
      "url": "https://drive.google.com/file/d/1gjNIl_DX1AuubO6dsQiAiXBT_keUmlBg/view?usp=drive_link"},
    {"title": "Agriculture Engineering-VI Sem",
      "url": "https://drive.google.com/file/d/1NIdGYqdjHjsR28Ug7d1B2nWGsLPtSZFe/view?usp=drive_link"},
  ];

  // void _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (!await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     print("Could not launch $url");
  //   }
  // }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch $url");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          children:[ Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.brown.shade500,Colors.black87], // Three colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4, 1.0], // Defines the positions of colors
              ),
            ),
          child: Column( children: [
      ZoomIn(
        duration: Duration(milliseconds: 1000),
        child: Container(
          padding: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          margin: EdgeInsets.all(10.0),
          height: 135,
          child: Text(
              'All Semesters \nSyllabus',
              style: TextStyle(
                  fontFamily: 'nexaheavy',
                  fontSize: 35,
                  color: Colors.white),
            ),
        ),
      ),
       Expanded(
         child: ZoomIn(
           duration: Duration(milliseconds: 1000),
           child: ListView.builder(
              // padding: EdgeInsets.all(16.0),
              itemCount: links.length,
              itemBuilder: (context, index) {
                return Column(
                    children: [
                      SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () => _launchURL(links[index]["url"]!),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 130,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Color(0xfffebebe), // Background color
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xfffebebe), // Shadow color
                              blurRadius: 8, // Shadow blur radius
                              offset: Offset(0, 2), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                SizedBox(width: 15,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(links[index]["title"]!, style: TextStyle(
                                        fontFamily: 'sans-serif-heavy',
                                        fontSize: 22),),
                                    Row(
                                      children: [
                                Text(' Syllabus',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 20),),
                                        SizedBox(width: 200,),
                                        Icon(Icons.arrow_forward_ios_outlined,size: 15,color: Colors.black),
                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                    ),
                  ),
                ]
                );
              }
              ),
         ),
       ),
          ]
          ),
          )
          ]
          )
    );
  }
}
