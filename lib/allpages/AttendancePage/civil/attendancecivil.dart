import 'package:animate_do/animate_do.dart';
import 'package:educationapk/allpages/AttendancePage/civil/civilfirstyear.dart';
import 'package:educationapk/allpages/AttendancePage/civil/civilsecondyear.dart';
import 'package:educationapk/allpages/AttendancePage/civil/civilthirdyear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Attendancecivil extends StatelessWidget {
  const Attendancecivil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Attendance History',style: TextStyle(fontFamily: 'nexalight',fontSize: 25),),
      ),

      body:

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideInRight(
              child: SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Civilfirstyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Civil 1st Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ),
            SizedBox(height: 80,),
            SlideInLeft(
              child: SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Civilsecondyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Civil 2nd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ),
            SizedBox(height: 80,),
            SlideInRight(
              child: SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Civilthirdyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Civil 3rd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
