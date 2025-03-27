import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChemSyllabus1 extends StatelessWidget {
  final List<Map<String, String>> links = [
    {"title": "Engineering Ist Year",
      "url": "https://drive.google.com/file/d/1bCgIcKi6WNbZIgu2QcxCmLJjkGZULUoQ/view?usp=drive_link"},
    {"title": "Chemical Engineering-III Sem",
      "url": "https://drive.google.com/file/d/1nEMwM2ZijcKgA-VvtT7fZDzj7xD0Y0PE/view?usp=drive_link"},
    {"title": "Chemical Engineering-IV Sem",
      "url" : "https://drive.google.com/file/d/1LpGuz72a8NEVr_8Lzf8qouZQN4HlkZic/view?usp=drive_link"},
    {"title": "Chemical Engineering-V Sem",
      "url": "https://drive.google.com/file/d/14kWVjof9LLvsBekepOeOTWpvJqxv8oHj/view?usp=drive_link"},
    {"title": "Chemical Engineering-VI Sem",
      "url": "https://drive.google.com/file/d/1JfTK4NXszaOCF4CCyldhfJf3v8bbPOMr/view?usp=drive_link"},
  ];

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
                  gradient: LinearGradient(colors: [Colors.green,Colors.white],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft)
              ),
              child: Column( children: [
                Container(
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
                Expanded(
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
                                    color: Colors.greenAccent, // Background color
                                    borderRadius: BorderRadius.circular(20), // Rounded corners
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.brown, // Shadow color
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
              ]
              ),
            )
            ]
        )
    );
  }
}
