import 'package:animate_do/animate_do.dart';
import 'package:educationapk/allpages/AttendancePage/paint/paintfirstyear.dart';
import 'package:educationapk/allpages/AttendancePage/paint/paintsecondyear.dart';
import 'package:educationapk/allpages/AttendancePage/paint/paintthirdyear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Attendancepaint extends StatelessWidget {
  const Attendancepaint({super.key});

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
                  Get.to(Paintfirstyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Chem. Paint 1st Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
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
                  Get.to(Paintsecondyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Chem. Paint 2nd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
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
                  Get.to(Paintthirdyear());
                  // Get.to(()=>MyHomePage());
                },
                  child: Text('Chem. Paint 3rd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
