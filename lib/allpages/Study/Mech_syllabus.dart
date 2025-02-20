import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MechSyllabus extends StatelessWidget {
  final List<Map<String, String>> links = [
    {"title": "Engineering Ist Year",
      "url": "https://drive.google.com/file/d/1bCgIcKi6WNbZIgu2QcxCmLJjkGZULUoQ/view?usp=drive_link"},
    {"title": "Mechanical Engineering-III Sem",
      "url": "https://drive.google.com/file/d/12h-kTUBB1FgjwWinS-v8h_4-yAkZCyUO/view?usp=drive_link"},
    {"title": "Mechanical Engineering-IV Sem",
      "url" : "https://drive.google.com/file/d/1LgPHT_tgUSpQASGnbVoiuYJjUB2G6GSr/view?usp=drive_link"},
    {"title": "Mechanical Engineering-V Sem",
      "url": "https://drive.google.com/file/d/1zGfXJgUTGjwOzB8TE0UKsCpiQUcIk_Mv/view?usp=drive_link"},
    {"title": "Mechanical Engineering-VI Sem",
      "url": "https://drive.google.com/file/d/1T002kh0_3w70Yjrn3oM8eHTpUMAyCpvb/view?usp=drive_link"},
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
                image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/premium-photo/creative-glowing-circuit-texture-technology-hardware-concept-3d-rendering_670147-51951.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                    fit: BoxFit.cover
                ),
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
              ]
              ),
            )
            ]
        )
    );
  }
}
