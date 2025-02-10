import 'package:flutter/material.dart';

class c_page extends StatelessWidget {
  const c_page({super.key});

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
                        Image.asset('assets/logos/C logo.png',height: 150,width: 200,),
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
              Text('C is a general-purpose programming language created by Dennis Ritchie at the Bell Laboratories in 1972. '
              '\n\nIt is one of the most popular programming languages in the world. \n\nIf you know C, you will have no problem learning other popular programming languages such as Java, Python, C++, C#, etc, as the syntax is similar.'
              ' \n\nC is very fast, compared to other programming languages, like Java and Python.'
                '\n\nC is very versatile; it can be used in both applications and technologies.',
              style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                SizedBox(height: 20,),
                Text('Roadmap to Learn''\nC Programming -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
              SizedBox(height: 10,),
                Text('Phase 1: Basic of C Programming 🥇',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
                Text('Introduction to C',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                  SizedBox(width: 20,),
                  Text('History and evalution of C',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                ],
              ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Setting up the development \nenvironment (IDE or text editor, \ncompiler)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Basic Syntax',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('History and evalution of C',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Writing and compiling your \nfirst C program',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Understanding main(), printf(),\n and return 0',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Data Types and Variables',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Primitive data types \n(int, char, float, double)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Declaring and initializing \nvariables',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Constants and literals',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Operators and Expressions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Arithmetic operators',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Relational and logical operators',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Assignment operators',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Increment and decrement \noperators',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Type casting',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Phase 2: Control Structures 🚦',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Conditional Statements',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('if, if-else, and nested if-else',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('switch statement',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Loops',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('for loop',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('while loop',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('do-while loop',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Nested loops',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Control Flow',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('break and continue statements',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('goto statement',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Phase 3: Functions💯',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Introduction to Functions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Function declaration and definition',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Calling functions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Return values and void \nfunctions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Parameter Passing',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Passing arguments by value \nScope and lifetime of \nvariables',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Recursion',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Phase 4: Arrays and Strings ⬜⬜⬜⬜⬜',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Arrays',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Single-dimensional arrays',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Multi-dimensional arrays',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Array manipulation',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Strings',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('String handling functions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('String manipulation',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Array of strings',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Phase 5: Pointers 👈👉',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                Image.network('https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fsn2ky712jms92n3mptt7.png',height:200,width:400,),
                SizedBox(height: 10,),
                Text('Introduction to Pointers',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Understanding pointers',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Pointer arithmetic',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Pointers and arrays',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Advanced Pointers',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Pointers to pointers',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Pointers and functions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Phase 6: Structures and Unions 😆',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Structures',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Defining and declaring structures',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Accessing structure members',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Array of structures',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Unions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Defining and declaring unions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Difference between structures \nand unions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Applications of unions',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Phase 7: File Handling 📁',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                Image.network('https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Ft5repik8lxgwbseekwj4.png',height:400,width:400,),
                SizedBox(height: 10,),
                Text('File Operations',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Opening and closing files',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Reading from and writing \nto files',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('File modes',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Advanced File Handling',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('File pointers',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Error handling in file operations',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle,size: 10,color: Colors.blue,),
                    SizedBox(width: 20,),
                    Text('Binary file I/O',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                  ],
                ),
                SizedBox(height: 20,),
                Text('Future Scope of''\nC Programming -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                SizedBox(height: 15,),
                Text('Despite the emergence of newer languages, C language is expected to maintain a strong future scope, '
                    '\nparticularly in areas like embedded systems, operating system development,compiler design, and low-level system programming'
                    ' \ndue to its efficiency and direct hardware control capabilities;',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
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
