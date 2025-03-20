import 'package:flutter/material.dart';

class Htmlpage extends StatelessWidget {
  const Htmlpage({super.key});

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
                            Image.asset('assets/logos/html logo.png',height: 150,width: 200,),
                            SizedBox(width: 2,),
                            Text('Markup language',style:
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
                              Text('HTML stands for Hyper Text Markup Language'
                                  ' \n\nHTML is the standard markup language for creating Web pages'
                                  '\n\nHTML describes the structure of a Web page''\n\nHTML consists of a series of elements''\n\nHTML elements tell the browser how to display the content'
                                '\n\nHTML elements label pieces of content such as "this is a heading", "this is a paragraph", "this is a link", etc.',
                                style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\nHTML -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 10,),
                              Text('Phase 1: Beginner Level:🥇',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Understand the Basics:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn what HTML is and its \nrole in web development.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand the structure of \nan HTML document.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
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
                              Text('Text Formatting:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn how to format text using \ntags like <strong>, <em>, <u>, \n<del>, <ins>, <sup>, and <sub>.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Lists: (Important concept for navbars)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn how to create ordered (<ol>) \nand unordered (<ul>) lists, \nas well as list items (<li>).',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Links and Navigation:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand how to create \nhyperlinks with the <a> tag.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore linking to external pages, \ninternal pages, and specific \nsections within a page.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Images:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn how to embed images \nusing the <img> tag.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Forms:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand the basics of \ncreating forms using tags like \n<form>,<input>, <textarea>, \n<select>, and <button>.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Semantic HTML:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn about semantic HTML \nelements (<header>, <nav>, \n<main>,<article>, <section>, \n<footer>) and their role in \ncreating a structured document.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Attributes:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand how to use \nattributes within HTML tags.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore common attributes like \nclass, id, src, alt, href, etc.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 2: Intermediate Level:🚦',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Tables:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn how to create tables \nusing tags like <table>, \n<tr>, <td>, <th>.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand table structure \nand formatting.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Embedded Content:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore embedding multimedia \ncontent like videos and audio \nusing <iframe>, <audio>, <video>.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('HTML Forms and Input Types:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Dive deeper into forms by \nunderstanding different \ninput types (text, checkbox, \nradio, submit, etc.).',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn about form validation.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('HTML5 New Features:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Explore new HTML5 features like \n<article>, <section>, <header>, \n<footer>, <nav>, <figure>, \n<figcaption>, etc.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 3: Advanced Level:💯',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Accessibility:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn about making your HTML \naccessible, including the use of \nARIA roles and attributes.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
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
                                  Text('Understand how to create \nresponsive layouts using \nmedia queries and \nflexible grid systems.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('SEO Basics:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Learn about basic SEO \n(Search Engine Optimization) \nprinciples for HTML.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('HTML Semantics and Best Practices:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Understand best practices for \nwriting clean and semantic \nHTML code.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text('Future Scope of''\nHTML-',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('The future scope of HTML looks bright, with continued evolution in features like '
                                  '\n enhanced accessibility, integration with emerging technologies like AR/VR, improved responsiveness across devices,'
                                  ' \nand a focus on semantic HTML to create more structured and meaningful web content',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
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
