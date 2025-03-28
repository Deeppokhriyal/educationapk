import 'package:educationapk/teacherpanel/bottombar/teacheralarmscheduler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart'; // Import animation package

class TeacherSchedulerstart extends StatelessWidget {
  const TeacherSchedulerstart({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(top: 110,left: 30,right: 30),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SlideInRight(
                        duration: Duration(milliseconds: 300),
                        child: Text('Hey',
                            style: TextStyle(fontSize: 32, fontFamily: 'nexalight')),
                      ),
                      SlideInLeft(
                        duration: Duration(milliseconds: 300),
                        child: Text('Let\'s Create',
                            style: TextStyle(fontSize: 32, fontFamily: 'nexalight')),
                      ),
                      SizedBox(height: 20),
                      SlideInRight(
                        duration: Duration(milliseconds: 500),
                        child: Text('Your Own',
                            style: TextStyle(fontSize: 33, fontFamily: 'nexalight')),
                      ),
                      SlideInLeft(
                        duration: Duration(milliseconds: 500),
                        child: Text('Schedule',
                            style: TextStyle(fontSize: 33, fontFamily: 'nexalight')),
                      ),
                      SizedBox(height: 75),
                      SlideInDown(
                        duration: Duration(milliseconds: 600),
                        child: Text('Presenting',
                            style: TextStyle(fontSize: 38, fontFamily: 'nexaheavy',color: Colors.black54)),
                      ),
                      SizedBox(height: 10),
                      SlideInLeft(
                        duration: Duration(milliseconds: 700),
                        child: Text('Task',
                            style: TextStyle(fontSize: 38, fontFamily: 'nexaheavy',color: Colors.green)),
                      ),
                      SlideInRight(
                        duration: Duration(milliseconds: 700),
                        child: Text('Scheduler',
                            style: TextStyle(fontSize: 38, fontFamily: 'nexaheavy',color: Colors.green)),
                      ),
                      SizedBox(height: 60),
                      BounceInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Container( decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(35),),
                            child: TextButton(
                              onPressed: () {
                                Get.to(()=>Teacheralarmscheduler());
                              },
                              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Create',style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: 'nexaheavy'), // Customize text style
                                  ),
                                  SizedBox(width: 20,),
                                  Icon(Icons.arrow_forward,color: Colors.white,size: 35,),
                                ],
                              ),
                            ),
                          )

                      ),
                    ],
                  ),
                )
            ),
          ),
        ],
      )

    );
  }
}