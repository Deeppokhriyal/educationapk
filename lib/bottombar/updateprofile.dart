import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 0.2),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body:  Stack(
          children:[
            Container(
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
      fit: BoxFit.cover,
      ),
      ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                Stack(children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                            image: AssetImage("assets/images/facebook.png"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber,
                      ),
                      child: Icon(LineAwesomeIcons.camera_solid,
                          size: 20, color: Colors.black),
                    ),
                  )
                ]),
              ]),
            ),
          ),
        ),
      ] ,
      )
    );
  }
}