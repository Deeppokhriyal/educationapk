import 'package:animate_do/animate_do.dart';
import 'package:educationapk/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Starting extends StatefulWidget {
  const Starting({super.key});

  @override
  State<Starting> createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'starting page',
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State variable to keep track of the selected index

  // Method to handle item taps

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: ListView(
        children: [
          FadeIn(
            duration: Duration(milliseconds: 1200),
            child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 25, 20, 20),
                    child: Image.asset('assets/images/startrow.jpg', alignment: Alignment.center,),
                  ),SizedBox(height: 20,),
                  Text('The only study app\n   you\'ll ever need', style: TextStyle(fontFamily: 'sans-serif-medium',fontWeight: FontWeight.bold,fontSize: 35, color: Colors.black),),
                  SizedBox(height: 25,),
                  Text('             Uploaded all study materials,\n'
                      'create and explore the polyverse with us and\n'
                      '      learn some programming knowledge.', style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 17, color: Colors.black),),
                  SizedBox(height: 55),
                  Container( decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(35),border: Border.all(width: 6)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottombar()));
                      },
                      child: Text('Let\'s start',style: TextStyle(fontSize: 20, color: Colors.white), // Customize text style
                      ),
                    ),
                  )
                ],
              ),
          ),
        ]    ),
    );
  }
}