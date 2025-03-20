import 'package:flutter/material.dart';

class Javapage extends StatelessWidget {
  const Javapage({super.key});

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
                            Image.asset('assets/logos/java logo.png',height: 150,width: 200,),
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
                              Text('Java is a popular programming language, created in 1995.\n\nIt is owned by Oracle, and more than 3 billion devices run Java.\n\nIt is used for:\n\nMobile applications (specially Android apps)\nDesktop applications\nWeb applications\nWeb servers and application servers\nGames\nDatabase connection\nAnd much, much more!',
                                style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
                              SizedBox(height: 20,),
                              Text('Roadmap to Learn''\nJAVA -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 10,),
                              Text('Phase 1: Core Java',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Beginning with the basics, you must first learn the Core Java concepts when following the Java roadmap. Here are the important ones to know:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('String class',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Data types and variables',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Features and architectures',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
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
                                  Text('Collection framework',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Object Oriented Programming\n(OOP) concept in depth',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('JAVA IO streams',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Exception handling',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Conditional statements and loops',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Multithreading',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Java architecture',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 2: Advanced Java',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('The advanced topics are mostly to be well-versed by experts. For beginners, gaining insights into the same with information on their concepts and working is enough:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('JVM',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Garbage collection',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Design pattern',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Servlet and JSP',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Constructor chaining',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Concurrent programming',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('String and Reverse array in Java',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 3: IDE',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Essential for enhancing productivity and workflow optimization, the Integrated Development Enhancement (IDE) concepts to be familiar with are:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Code editing, compilation\nand running',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Classpath management',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Refactoring tools',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('VS Code',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('IntelliJ IDEA',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Eclipse',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text(' Spring Tool Suite',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 4: Build Tools',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('The tools that help in developing Java code include:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Gradle',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Maven',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Apache Ant',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Dependency management',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 5: Servers',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('This part plays a role during application deployment and hence must be learned till you reach this phase in the Full Stack Java developer roadmap:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Tomcat',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('JBOSS',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('GlassFish',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('WebSphere',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Jetty',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 5: Frameworks',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Frameworks in Java are essential for the seamless performance of tasks concerning debugging, enhancing code efficiency, ensuring its reuse and decreasing the development time. The important Java frameworks to be familiar with are:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('JavaServer Faces (JSF)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Spring',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Hibernate',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Google Web Toolkit (GWT)',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Spring Boot',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 5: Testing',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('It is a crucial aspect to get hold of when learning Java. The key concepts to be well-versed with are:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Unit testing',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Debugging code',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Integration testing',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Mockito',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Jetty',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Phase 5: Database',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('The databases are significant when looking for data storage. Working on these involves writing, editing and handling queries for various operations. You must know the language, system and frameworks here. Here is what to focus on:',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('DBA',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Constraints',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('ACID',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('Joins',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle,size: 10,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text('MongoDB',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text('Future Scope of''\nJava -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
                              SizedBox(height: 15,),
                              Text('Java is expected to remain in high demand in the future, and the scope for Java developers looks promising. Java is a versatile programming language used in many industries, including financial services, retail, and healthcare. ',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
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
