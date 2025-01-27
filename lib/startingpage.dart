import 'package:educationapk/homepage.dart';
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
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Image.asset('assets/images/startrow.jpg', alignment: Alignment.center,),
              ),SizedBox(height: 25,),
              Text('The only study app\n   you\'ll ever need', style: TextStyle(fontFamily: 'sans-serif-medium',fontWeight: FontWeight.bold,fontSize: 35, color: Colors.black),),
              SizedBox(height: 15,),
              Text('Upload class study materials,create\n      electronic flashcards to study.', style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 17, color: Colors.black),),
              SizedBox(height: 50),
              Container( decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(35),border: Border.all(width: 6)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyMainHome()));
                  },
                  child: Text('Let\'s start',style: TextStyle(fontSize: 20, color: Colors.white), // Customize text style
                  ),
                ),
              )
            ],
          ),

        ]    ),
    );
  }
}