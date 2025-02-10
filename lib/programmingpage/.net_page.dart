import 'package:flutter/material.dart';

class net_page extends StatelessWidget {
  const net_page({super.key});

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
                            Image.asset('assets/logos/.net logo.png',height: 150,width: 200,),
                            SizedBox(width: 2,),
                            Text('Software Development Framework',style:
                            TextStyle(color: Colors.white),),
                          ]
                      )
                    ),
                      SizedBox(height: 10),
                      Container( padding: EdgeInsets.all(20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('The .NET platform (pronounced as "dot net") is a free and open-source, managed computer software framework for Windows, Linux, and macOS operating systems.[4] The project is mainly developed by Microsoft employees\n\n.NET fully supports C# and F# (and C++/CLI as of 3.1; only enabled on Windows) and supports Visual Basic .NET (for version 15.5 in .NET Core 5.0.100-preview.4, and some old versions supported in old .NET Core). ',
                                style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\n.NET -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                        InteractiveViewer(
                            boundaryMargin: EdgeInsets.all(20),
                            minScale: 1.0,
                            maxScale: 4.0,
                              child: Image.network('https://miro.medium.com/v2/resize:fit:1100/format:webp/1*qTO-DSXjEBXKtZDnIrr9Og.png',height:700,width:400)
                        ),
                              SizedBox(height: 20,),
                              Text('Future Scope of''\n.NET -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('The future scope of .NET is promising, with a growing demand for .NET developers. .NET is a flexible, open-source framework that can be used to build scalable software applications. It is used to create web and mobile applications, and can also be integrated with cloud services. ',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),
                              ),
                            ]
                        )
                      ),
                    ]
                )
              ),
              ]
          ),
          ]
      ),
    );
  }
}
