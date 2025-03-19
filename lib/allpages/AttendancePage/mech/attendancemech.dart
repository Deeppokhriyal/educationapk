import 'package:animate_do/animate_do.dart';
import 'package:educationapk/allpages/AttendancePage/mech/mechfirstyear.dart';
import 'package:educationapk/allpages/AttendancePage/mech/mechsecondyear.dart';
import 'package:educationapk/allpages/AttendancePage/mech/mechthirdyear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Attendancemech extends StatelessWidget {
  const Attendancemech({super.key});

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
                  Get.to(Mechfirstyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Mechanical 1st Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
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
                  Get.to(Mechsecondyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Mechanical 2nd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
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
                  Get.to(Mechthirdyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Mechanical 3rd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
