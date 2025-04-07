import 'package:animate_do/animate_do.dart';
import 'package:educationapk/adminpanel/beforestart/adminlogin.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Starting extends StatefulWidget {
  const Starting({super.key});

  @override
  State<Starting> createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  String selectedRole = 'Student'; // Default selection

  // Function to handle navigation
  void navigateToLogin() {
    if (selectedRole == 'Student') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyLogin()));
    } else if (selectedRole == 'Teacher') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TeacherLogin()));
    } else if (selectedRole == 'Principal') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminLogin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          FadeIn(
            duration: Duration(milliseconds: 1200),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                  child: Image.asset(
                    'assets/images/startrow.jpg',
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'The only study app\n   you\'ll ever need',
                  style: TextStyle(
                    fontFamily: 'sans-serif-medium',
                    fontWeight: FontWeight.bold,
                    fontSize: 35.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  '             Uploaded all study materials,\n'
                      'create and explore the polyverse with us and\n'
                      '      learn some programming knowledge.',
                  style: TextStyle(
                    fontFamily: 'sans-serif-thin',
                    fontSize: 17.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),

                // Dropdown for role selection
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5.w),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedRole,
                      dropdownColor: Colors.white,
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      borderRadius: BorderRadius.circular(15.r),
                      items: ['Student', 'Teacher', 'Principal']
                          .map((role) => DropdownMenuItem(
                        value: role,
    child: Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Text(role,
                            style: TextStyle(
                                fontSize: 18.sp, color: Colors.black)),
    )
                      ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedRole = newValue!;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(width: 6.w),
                  ),
                  child: TextButton(
                    onPressed: navigateToLogin,
                    child: Text(
                      'Let\'s start',
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
