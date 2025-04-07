import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/controllers/signupController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MySignUpPage extends StatefulWidget {
  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  final SignupController controller = Get.put(tag: 'SignupController', SignupController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? selectedBranch; // Selected Branch
  String? selectedYear; // Selected Year

  final List<String> branchItems = [
    'IT', 'AGRICULTURE', 'CHEMICAL', 'PAINT', 'CIVIL',
    'CSE', 'ELEX', 'MECH', 'PHARMACY',
  ];

  final List<String> yearItems = [
    '1st Year', '2nd Year', '3rd Year',
  ];

  Future<void> signUpStudent() async {
    if (nameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        selectedBranch == null ||
        selectedYear == null) {
      showError("Please fill in all fields");
      return;
    }

    try {
      String email = usernameController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String branch = selectedBranch!;
      String year = selectedYear!;

      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        showError("Invalid email format");
        return;
      }

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.sendEmailVerification();
      print("Verification email sent to $email");

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'branch': branch,
        'year': year, // 🔥 Year Field Firebase Me Store Ho Raha Hai
        'role': 'student',
        'createdAt': FieldValue.serverTimestamp(),
      });

      showSuccess("Verification email sent! Please check your email.");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLogin()));
    } catch (e) {
      showError("Error: ${e.toString()}");
    }
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/abstract-colorful-low-poly-triangle-shapes_361591-4167.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:0.12.sh, left: 30.w),
            child: Text(
              'Welcome !\nCreate Your Account',
              style: TextStyle(color: Colors.black, fontSize: 38.sp, fontFamily: 'sans-serif-thin'),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top:0.26.sh, right: 30.w, left: 30.w),
              child: Column(
                children: [
                  Divider(color: Colors.black),

                  // 🔽 Year Dropdown
                  SizedBox(
                    width: double.infinity, // Full width
                    child: DropdownButton<String>(
                      isExpanded: true,
                      style: TextStyle(color: Colors.purple, fontSize: 20.sp, fontFamily: 'nexalight'),
                      borderRadius: BorderRadius.circular(35.r),
                      value: selectedYear,
                      hint: Text('Select Your Year'),
                      items: yearItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedYear = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // 🔽 Branch Dropdown
                  SizedBox(
                    width: double.infinity, // Full width
                    child: DropdownButton<String>(
                      isExpanded: true, // Ensures full width inside SizedBox
                      style: TextStyle(color: Colors.purple, fontSize: 20.sp, fontFamily: 'nexalight'),
                      borderRadius: BorderRadius.circular(35.r),
                      value: selectedBranch,
                      hint: Text('Select Your Branch'),
                      items: branchItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBranch = newValue;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 20.h),

                  TextField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    style: TextStyle(fontFamily: 'nexalight'),
                    decoration: InputDecoration(
                      hintText: 'Enter your Name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(35.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(35.r)),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  TextField(
                    controller: usernameController,
                    cursorColor: Colors.black,
                    style: TextStyle(fontFamily: 'nexalight'),
                    decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(35.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(35.r)),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    cursorColor: Colors.black,
                    style: TextStyle(fontFamily: 'nexalight'),
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(35.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(35.r)),
                    ),
                  ),
                  SizedBox(height: 35.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => signUpStudent(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        textStyle: TextStyle(fontSize: 18.sp),
                      ),
                      child: Text('Sign up', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 80.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account?', style: TextStyle(color: Colors.black, fontSize: 14.sp, fontFamily: 'nexalight')),
                      SizedBox(width: 50.w),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('Log in', style: TextStyle(color: Colors.blue, fontSize: 18.sp)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
