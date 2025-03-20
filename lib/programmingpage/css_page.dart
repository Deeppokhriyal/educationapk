import 'package:flutter/material.dart';

class Csspage extends StatelessWidget {
  const Csspage({super.key});

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
                            Image.asset('assets/logos/css logo.png',height: 150,width: 200,),
                            SizedBox(width: 2,),
                            Text('Styling language',style:
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
                              Text('CSS stands for Cascading Style Sheets'
                                  ' \n\nCSS describes how HTML elements are to be displayed on screen, paper, or in other media'
                                  '\n\nCSS saves a lot of work. It can control the layout of multiple web pages all at once''\n\nExternal stylesheets are stored in CSS files',
                                style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\nCSS -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 10,),
                              Text('Phase 1: Beginner Level:🥇',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Basics of CSS:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand the fundamentals \nof CSS, including selectors, \nproperties, and values.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn how to link CSS to \nHTML documents.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore basic HTML tags like \n<html>, <head>, <body>, <p>, \n<h1> to <h6>, <a>, <img>, etc.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Box Model:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Master the CSS box \nmodel, including margin, \npadding, border, and content.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand how box model \nproperties affect layout.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Positioning:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn different positioning \nschemes (static, relative, \nabsolute, fixed).',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand the concept \nof stacking context.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Flexbox:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Master Flexbox for \ncreating flexible and \nefficient layouts.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand the properties \nand values associated \nwith Flexbox.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Grid Layout:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore CSS Grid \nLayout for creating \ntwo-dimensional layouts.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn about grid \ncontainers and \ngrid items.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Responsive Design:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand media queries \nfor responsive web design.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn to create layouts \nthat adapt to different \nscreen sizes.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Transitions and Animations:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Master CSS transitions for \ncreating smooth animations \nbetween states.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore CSS animations \nfor more complex and \ncustomized animations.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 2: Intermediate Level:🚦',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Transformations:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn 2D and 3D \ntransformations using CSS.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand properties like \ntransform, rotate, scale, \nand translate.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Filters and Blend Modes:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore CSS filters \nfor image effects \n(e.g., blur, grayscale).',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn about blend modes \nfor combining layers.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Custom Properties (Variables):',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand the use of \ncustom properties in CSS.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn how to use \nvariables to make styles \nmore maintainable.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('CSS Preprocessors:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore popular CSS \npreprocessors like \nSass or Less.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand the benefits of \npreprocessing, such as \nvariables and mixins.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('CSS Architecture and \nBest Practices:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn about modular \nCSS and scalable architecture.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand best practices \nfor writing maintainable \nand efficient CSS.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Browser Developer Tools:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Familiarize yourself with \nbrowser developer tools for \ndebugging and testing.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn how to inspect \nand manipulate styles \nin real-time.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 3: Advanced Level:💯',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('CSS Frameworks:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore popular CSS \nframeworks like Bootstrap \nor Tailwind CSS.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Cross-Browser Compatibility:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn techniques for ensuring \nCSS compatibility across \ndifferent browsers.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand potential pitfalls \nand how to address them.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(' Continued Learning and \nAdvanced Topics:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Stay updated on new features \nand specifications in CSS.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore advanced topics \nlike Houdini and the \nfuture of CSS.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Project Work:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Apply your CSS knowledge \nby working on real-world \nprojects.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text('Future Scope of''\nCSS -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('CSS is continuously evolving, driven by technological advancements, '
                                  '\nuser expectations, and new methodologies. The future of css promises '
                                  '\nmore immersive, interactive, and user-centric experiences,',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
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
