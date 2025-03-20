import 'package:flutter/material.dart';

class Phppage extends StatelessWidget {
  const Phppage({super.key});

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
                            Image.asset('assets/logos/php logo.png',height: 150,width: 200,),
                            SizedBox(width: 2,),
                            Text('Server Side Scripting language',style:
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
                              Text('PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages.\n\nPHP is a widely-used, free, and efficient alternative to competitors such as Microsoft ASP.',
                                style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\nPHP -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              Image.network('https://blogger.googleusercontent.com/img/a/AVvXsEg56Xvrs9ru9u4YeInZlgqzr_j2ZWgC2H8ONNXSvAf2mcVCvpsKlQpdcz3nvQJw979cRN1MEWBSz3a9BAdfP04VnvQaaamAM_BzKxPlm1RzZ_4lY79H5OS53-UJS8nfayGJFvheTUTfZEKT9Vn9Z9Zm4e1vzZZA2fWAPWkBEleMXJQoxjddwackTGZZ=w635-h1066',height:700,width:400,),
                              SizedBox(height: 20,),
                              Text('Future Scope of''\nPHP -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('PHP future is promising despite doubts. It remains dominant in web development, with PHP 8 enhancements boosting its competitiveness. Specializing in APIs, microservices, and cloud projects, PHP continues to evolve. Improvements in performance and security are ongoing, ensuring PHP relevance. Expect tailored tools for PHP developers, enhancing their experience. PHP future is bright, adapting to trends and remaining a key player in web development.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
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
