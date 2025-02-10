
import 'package:educationapk/programmingpage/c++_page.dart';
import 'package:educationapk/programmingpage/css_page.dart';
import 'package:educationapk/programmingpage/js_page.dart';
import 'package:educationapk/programmingpage/python_page.dart';
import 'package:flutter/material.dart';

import '../programmingpage/c_page.dart';
import '../programmingpage/html_page.dart';
class programmingpage extends StatefulWidget {
  const programmingpage({super.key});

  @override
  State<programmingpage> createState() => _programmingpageState();
}

class _programmingpageState extends State<programmingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
          children:[ Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
                  fit: BoxFit.cover
              ),
            ),
            child: SingleChildScrollView(
              child:Column(
                  children:[
                    SizedBox(height: 70,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 110,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image:AssetImage('assets/logos/C logo.png'),height: 46,width: 50,),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('C',style: TextStyle(
                                        fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
                                    ),
                                    Text(' Programming language',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 89,),
                                InkWell(
                                    onTap : () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => c_page()),
                                      );
                                },
                                      child: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black)
            ),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children:[
    SizedBox(height: 34,),
    Text('Dennis Ritchie',style: TextStyle(
    fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
    ),
    SizedBox(width: 130,),
    Text(' 1970',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
    ]
    ),
    ],
    )
    ),

    SizedBox(height: 10,),
    Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(17),
    height: 110,
    width: 370,
    decoration:
    BoxDecoration(
    color: Colors.white, // Background color
    borderRadius: BorderRadius.circular(20),// Rounded corners
    boxShadow: [
    BoxShadow(
    color: Colors.grey, // Shadow color
    blurRadius: 5, // Shadow blur radius
    offset: Offset(0, 3), // Shadow offset
    ),
    ],
    ),
    child: Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Image(image:AssetImage('assets/logos/html logo.png'),height: 46,width: 50,),
    SizedBox(width: 12,),
    Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('HTML',style: TextStyle(
    fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
    ),
    Text(' Hypertext Markup Language',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
    ],
    ),
    SizedBox(width: 68,),
      InkWell(
          onTap : () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => html_page()),
            );
          },
          child: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black)
      ),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children:[
    SizedBox(height: 34,),
    Text('Tim Berners-Lee',style: TextStyle(
    fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
    ),
    SizedBox(width: 130,),
    Text(' 1990',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
    ]
    ),
    ],
    )
    ),

    SizedBox(height: 10,),
    Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(17),
    height: 110,
    width: 370,
    decoration:
    BoxDecoration(
    color: Colors.white, // Background color
    borderRadius: BorderRadius.circular(20),// Rounded corners
    boxShadow: [
    BoxShadow(
    color: Colors.grey, // Shadow color
    blurRadius: 5, // Shadow blur radius
    offset: Offset(0, 3), // Shadow offset
    ),
    ],
    ),
    child: Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Image(image:AssetImage('assets/logos/css logo.png'),height: 46,width: 50,),
    SizedBox(width: 12,),
    Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('CSS',style: TextStyle(
    fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
    ),
    Text(' Cascading Style Sheet',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
    ],
    ),
    SizedBox(width: 89,),
      InkWell(
          onTap : () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => css_page()),
            );
          },
          child: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black)
      ),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children:[
    SizedBox(height: 34,),
    Text('Hakon Wium Lie',style: TextStyle(
    fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
    ),
    SizedBox(width: 130,),
    Text(' 1994',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
    ]
    ),
    ],
    )
    ),

    SizedBox(height: 10,),
    Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(17),
    height: 110,
    width: 370,
    decoration:
    BoxDecoration(
    color: Colors.white, // Background color
    borderRadius: BorderRadius.circular(20),// Rounded corners
    boxShadow: [
    BoxShadow(
    color: Colors.grey, // Shadow color
    blurRadius: 5, // Shadow blur radius
    offset: Offset(0, 3), // Shadow offset
    ),
    ],
    ),
    child: Column(mainAxisAlignment: MainAxisAlignment.start,
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Image(image:AssetImage('assets/logos/js logo.png'),height: 46,width: 100,),
    // SizedBox(width: 1,),
    Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('JS',style: TextStyle(
    fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
    ),
    Text(' JavaScript',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
    ],
    ),
    SizedBox(width: 100,),
      InkWell(
          onTap : () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => js_page()),
            );
          },
          child: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black)
      ),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  SizedBox(height: 34,),
                                  Text('Brendan Eichin',style: TextStyle(
                                      fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
                                  ),
                                  SizedBox(width: 130,),
                                  Text(' 1995',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                ]
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 110,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image:AssetImage('assets/logos/C++ logo.png'),height: 46,width: 50,),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('C++',style: TextStyle(
                                        fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
                                    ),
                                    Text(' Programming language',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 89,),
                                InkWell(
                                    onTap : () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => cpage()),
                                      );
                                    },
                                    child: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black)
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  SizedBox(height: 34,),
                                  Text('Bajarne Stroustrup',style: TextStyle(
                                      fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
                                  ),
                                  SizedBox(width: 100,),
                                  Text(' 1985',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                ]
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 110,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image:AssetImage('assets/logos/python logo.png'),height: 46,width: 50,),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Python',style: TextStyle(
                                        fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
                                    ),
                                    // Text(' Programming language',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 155,),
                                InkWell(
                                    onTap : () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => python_page()),
                                      );
                                    },
                                    child: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black)
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  SizedBox(height: 34,),
                                  Text('Guido Van Rossum',style: TextStyle(
                                      fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
                                  ),
                                  SizedBox(width: 110,),
                                  Text(' 1989',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                ]
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 110,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image:AssetImage('assets/logos/java logo.png'),height: 46,width: 50,),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Java',style: TextStyle(
                                        fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
                                    ),
                                    // Text(' Programming language',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 168,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  SizedBox(height: 34,),
                                  Text('James Gosling',style: TextStyle(
                                      fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
                                  ),
                                  SizedBox(width: 130,),
                                  Text(' 1995',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                ]
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 110,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image:AssetImage('assets/logos/php logo.png'),height: 46,width: 50,),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('PHP',style: TextStyle(
                                        fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
                                    ),
                                    Text(' Hypertext Preprocessor',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 89,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  SizedBox(height: 34,),
                                  Text('Rasmus Lerdorf',style: TextStyle(
                                      fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
                                  ),
                                  SizedBox(width: 130,),
                                  Text(' 1994',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                ]
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 110,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image:AssetImage('assets/logos/xml logo.png'),height: 46,width: 50,),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('XML',style: TextStyle(
                                        fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
                                    ),
                                    Text(' Extensible Markup Language',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 66,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  SizedBox(height: 34,),
                                  Text('Charles Goldfarb',style: TextStyle(
                                      fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
                                  ),
                                  SizedBox(width: 130,),
                                  Text(' 1970',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                ]
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(17),
                        height: 110,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(20),// Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image:AssetImage('assets/logos/.net logo.png'),height: 46,width: 50,),
                                SizedBox(width: 12,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('. Net',style: TextStyle(
                                        fontFamily: 'sans-serif-light',fontSize: 22,fontWeight:FontWeight.bold),
                                    ),
                                    Text(' Dot Net',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                                  ],
                                ),
                                SizedBox(width: 179,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.black),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  SizedBox(height: 34,),
                                  Text('Microsoft',style: TextStyle(
                                      fontFamily: 'sans-serif-light',fontSize: 20,fontWeight:FontWeight.normal),
                                  ),
                                  SizedBox(width: 180,),
                                  Text(' 2002',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 13),),
                                ]
                            ),
                          ],
                        )
                    ),
                  ]
              ),
            ),
          ),
          ]
      ),
    );
  }
}