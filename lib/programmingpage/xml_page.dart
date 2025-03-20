import 'package:flutter/material.dart';

class Xmlpage extends StatelessWidget {
  const Xmlpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
          children:[ Stack(
              children:[Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
                      fit: BoxFit.cover
                  ),
                ),
                child: Column(
                    children:[ Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10.0),
                      height: 200,
                      child: Column(
                          children: [
                            Image.asset('assets/logos/xml logo.png',height: 150,width: 200,),
                            SizedBox(width: 2,),
                            Text('High-level OOP language',style:
                            TextStyle(color: Colors.white),),
                          ]
                      ),
                    ),
                      SizedBox(height: 10),
                      Container( padding: EdgeInsets.all(20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('XML stands for Extensible Markup Language. It is a markup language that allows users to encode text in a way that is readable by both humans and machines. XML is used to store and transfer data on the web and in other applications. ',
                                style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\nXML -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),


                              Image.network('https://www.oreilly.com/api/v2/epubs/0672321750/files/0672321750_ch03lev1sec1_image01.jpeg',height:500,width:400,),

                              SizedBox(height: 20,),
                              Text('Future Scope of''\nXML -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('Future of XML. XML separates structure and content from presentation, enabling the same XML source document to be written once and displayed in many ways: by a web browser, on a monitor, within a cellular-phone display or translated into voice for a multi-media museum exhibit. ',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                            ]
                        ),
                      ),
                    ]
                ),
              ),
              ]
          ),
          ]
      ),
    );
  }
}
