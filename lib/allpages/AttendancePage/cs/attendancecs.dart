import 'package:animate_do/animate_do.dart';
import 'package:educationapk/allpages/AttendancePage/cs/csfirstyear.dart';
import 'package:educationapk/allpages/AttendancePage/cs/cssecondyear.dart';
import 'package:educationapk/allpages/AttendancePage/cs/csthirdyear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceCSE extends StatelessWidget {
  const AttendanceCSE({super.key});

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
                width: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Csfirstyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('CSE 1st Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ),
            SizedBox(height: 80,),
            SlideInLeft(
              child: SizedBox(
                height: 70,
                width: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Cssecondyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('CSE 2nd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ),
            SizedBox(height: 80,),
            SlideInRight(
              child: SizedBox(
                height: 70,
                width: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Csthirdyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('CSE 3rd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
