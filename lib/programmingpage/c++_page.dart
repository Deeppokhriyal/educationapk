import 'package:flutter/material.dart';

class CCpage extends StatelessWidget {
  const CCpage({super.key});

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
                            Image.asset('assets/logos/C++ logo.png',height: 150,width: 200,),
                            SizedBox(width: 2,),
                            Text('Programming language',style:
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
                              Text('C++ is a cross-platform language that \ncan be used to create high-\nperformance applications.\n\nC++ was developed by BjarneStroustrup, \nas an extension to the C language.'
                                  '\n\nC++ gives programmers a high \nlevel of control over system \nresources and memory.\n\nThe language was updated 5 \nmajor times in 2011, 2014, \n2017, 2020, and 2023 to \nC++11, C++14, C++17, C++20, \nand C++23.',
                                style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\nC++  -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 10,),
                              Text('(From scratch to to intermediate in just 5 steps)',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('❏ STEP 1',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('While learning a language we \nshould be familiar with some basic \nsyntax of input ( cin>> ) and \noutput ( cout<< ).After that \nwe should know what are \nthe variables and expressions '
                                      '\n\nhttp://www.cplusplus.com/\nreference/iolibrary/',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              Image.network('https://cplusplus.com/img/iostream.gif',height:200,width:400,),
                              SizedBox(height: 10,),
                              Text('❏ STEP 2',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('One can learn basic syntax \nand terminology of c++ from \nhackerrank (https://www.\nhackerrank.com/domains/cpp ) \nor hackerearth (https://www.\nhackerearth.com/practice/\nbasic-programming/input\n-output/basics-of-input-\noutput/tutorial/ )or W3schools \n(https://www.w3schools.com/cpp/)'
                                      '\n\nAnd one of the evergreen resource\nwhich everyone should follow \niscpluscplus.com ( http://www.\ncplusplus.com/doc/tutorial/ )',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('❏ STEP 3',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Now after clearing the \nbasic concepts of C++.\n Now moving forward we should'
                                      '\nfocus on different types \nof libraries C++ have.'
                                      '\nHere is the list of that\nlibraries with examples\nhttp://www.cplusplus.com\n/reference/clibrary/ )',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('❏ STEP 4',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Now here is the beauty \nof language is Containers.\n\nA container is a holder \nobject that stores a \ncollection of other objects\n(itselements).\n\nThey are implemented as class\ntemplates, which allows a\n/greatflexibility in the types\nsupported as elements.\n\nThere are two types of \ncontainers\n\n1) Sequence containers\n2) Associative containers',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(' ❏ STEP 5',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learning strategy of Containers\nhttps://www.geeksforgeeks.org\n/the-c-standard-template\n-library-stl/',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              Image.network('https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200219122316/Adaptive-and-Unordered-Containers-in-C-STL-768x455.png',height:200,width:400,),
                              SizedBox(height: 20,),
                              Text('Future Scope of''\nC++ -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('C++ is expected to maintain a strong future scope, particularly in areas requiring high performance and system-level development, including game development, embedded systems, high-frequency trading, and scientific computing, due to its speed and efficiency, making it a valuable skill for developers in critical application domains; even with newer languages emerging, C++ is likely to remain relevant in these niche areas where performance is paramount',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
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