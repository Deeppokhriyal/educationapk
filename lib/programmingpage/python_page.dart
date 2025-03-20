import 'package:flutter/material.dart';

class Pythonpage extends StatelessWidget {
  const Pythonpage({super.key});

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
                            Image.asset('assets/logos/python logo.png',height: 150,width: 200,),
                            SizedBox(width: 2,),
                            Text('Interpreted language',style:
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
                              Text('Python is a popular programming language. \n\nIt was created by Guido van Rossum, and released in 1991.\n\nIt is used for:\nweb development (server-side),\nsoftware development,\nmathematics,\nsystem scripting.', style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\nPYTHON -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 10,),
                              Text('Phase 1: Learning the Basics of Python',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('First of all, go to Python official website and download the latest version. Once the installation is done, you can write and run Python code with IDE.''\n\nThe following topics will be covered under this:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Variables in Python and String\nManipulation',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Conditional statements in Python',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Loops in Python',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Functions in Python,\nmodules & Imports',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Data structures like\nlists in Python and\nDictionaries in Python',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Exception handling in Python',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 2: Python Object Oriented Programming (OOP)',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('The following topics you need to study here:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Classes',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Object',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Inheritance',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Data Abstraction',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Polymorphism',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Encapsulation',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 3: Frameworks & Libraries',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Let us learn about the various Python libraries used for web applications.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Django',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Flask',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('FastAPI',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Now let us look at the various Python libraries used to create desktop applications.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('PyQT',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Tkinter',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('It time to have a look at various Data Visualization libraries offered by Python.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Matplotlib',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text(' Seaborn',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Machine Learning',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('TensorFlow',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text(' Scikit-Learn',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('  PyTorch',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 4: Python Multithreading',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('The following topics you need to learn here:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Starting a thread',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Join',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Thread pool',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Semaphores',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 5: File Handling in Python',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Python is the best programming language to edit, script, and automate whatever is related to the below file formats.',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('.txt',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('.csv',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('.pdf',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('.json',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('.zip',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text('Future Scope of''\nPYTHON -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('Python is expected to remain a top programming language in the future, with applications in many industries. This is due to its versatility, simplicity, and large community of users. '
                                  '\n\nCareer opportunities:\n\nWeb and app development\nData engineering\nFull stack development\nDevOps engineering\nIoT development\nProduct management',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
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
