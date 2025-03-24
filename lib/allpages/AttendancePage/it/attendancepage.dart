import 'package:animate_do/animate_do.dart';
import 'package:educationapk/allpages/AttendancePage/it/itfirstyear.dart';
import 'package:educationapk/allpages/AttendancePage/it/itsecondyear.dart';
import 'package:educationapk/allpages/AttendancePage/it/itthirdyear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceIT extends StatelessWidget {
  const AttendanceIT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Attendance History',style: TextStyle(fontFamily: 'nexalight',fontSize: 25),),
      ),

      body:

      Center(
        child: FadeInDownBig(
          duration: Duration(milliseconds: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Itfirstyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('I.T 1st Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
              SizedBox(height: 80,),
              SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Itsecondyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('I.T 2nd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
              SizedBox(height: 80,),
              SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                  ),  onPressed: () {
                  Get.to(Itthirdyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('I.T 3rd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
