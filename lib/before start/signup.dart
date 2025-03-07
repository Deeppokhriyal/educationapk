import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/controllers/signupController.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherotp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'dart:math';

class MySignUpPage extends StatefulWidget {
  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}
class _MySignUpPageState extends State<MySignUpPage> {
  final SignupController controller=Get.put(tag: 'SignupController',SignupController());
  TextEditingController usernameController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  Future<void> signUpStudent() async {
    if (nameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        selectedValue == null) {
      print("Please fill in all fields");
      return;
    }

    try {
      String email = usernameController.text.trim();

      // Check if email is valid
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        print("Invalid email format");
        return;
      }

      // Generate a random 4-digit OTP
      String otp = (Random().nextInt(9000) + 1000).toString();

      // Save OTP to Firestore for later verification
      await FirebaseFirestore.instance.collection('emailOtps').doc(email).set({
        'otp': otp,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Send email using FlutterEmailSender (or any SMTP package)
      final emailToSend = Email(
        body: 'Your OTP is: $otp',
        subject: 'OTP Verification',
        recipients: [email],
        isHTML: false,
      );

      await FlutterEmailSender.send(emailToSend);
      print("OTP sent to $email: $otp");

      // Navigate to OTP Verification Page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(email: email),
        ),
      );
    } catch (e) {
      print("Error: $e");
    }
  }

// Function to save user details to Firestore after OTP verification
  Future<void> saveUserToFirestore(String email, String name, String branch) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passwordController.text.trim(),
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'name': name,
        'branch': branch,
        'role': 'student',
      });

      print("User saved to Firestore successfully");
    } catch (e) {
      print("Failed to save user to Firestore: $e");
    }
  }



  String? selectedValue; // Variable to hold the selected branch

  // List of items for the dropdown (Branches)
  final List<String> items = [
    // 'Information Technology',
    // 'Agriculture Engineering',
    // 'Chemical Engineering',
    // 'Chemical Paint',
    // 'Civil',
    // 'Computer Science Engineering',
    // 'Electronics Engineering',
    // 'Mechanical Engineering',
    // 'Pharmacy',
    'IT',
    'AGRICULTURE',
    'CHEMICAL',
    'PAINT',
    'CIVIL',
    'CSE',
    'ELEX',
    'MECH',
    'PHARMACY',
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/abstract-colorful-low-poly-triangle-shapes_361591-4167.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25,top: 50),
              child: IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyLogin()));
              }, icon: Icon(Icons.arrow_back_ios,size: 30,),)
          ),

          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.12,left: 30),
            child: Text('Welcome !\nCreate you Account', style: TextStyle( color: Colors.black, fontSize: 38, fontFamily: 'sans-serif-thin'),),
          ),

          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.26,right: 30,left: 30),
              child: Column(
                children: [
                  Divider(color: Colors.black,),
                  DropdownButton<String>(
                    style: TextStyle(color: Colors.purple, fontSize: 20, fontFamily: 'nexalight'),
                    borderRadius: BorderRadius.circular(35),
                    value: selectedValue, // Current selected value
                    hint: Text('Select Your Branch',), // Hint text
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue; // Update the selected value
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: nameController,
                    cursorColor: Colors.black,style: TextStyle( fontFamily: 'nexalight'),
                    decoration: InputDecoration(
                      fillColor: Colors.pink,
                      hintText: 'Enter your Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),// Focused border color
                          borderRadius: BorderRadius.circular(35)
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: usernameController,
                    cursorColor: Colors.black,style: TextStyle( fontFamily: 'nexalight'),
                    decoration: InputDecoration(
                      fillColor: Colors.pink,
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),// Focused border color
                          borderRadius: BorderRadius.circular(35)
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(style: TextStyle( fontFamily: 'nexalight'),
                    controller: passwordController,
                    obscureText: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder( // Unfocused border color
                          borderRadius: BorderRadius.circular(35)
                      ),
                      focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.blue),// Focused border color
                         borderRadius: BorderRadius.circular(35)
                      ),
                    ),
                  ),
                  SizedBox(height: 35,),
                  SizedBox(
                    width: double.infinity, // Full width
                    child: ElevatedButton(
                      onPressed: () =>signUpStudent(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Set background color to black
                        padding: EdgeInsets.symmetric(vertical: 15), // Button height
                        textStyle: TextStyle(fontSize: 18, ), // Font size
                      ),
                      child: Text('Sign up',style: TextStyle(color: Colors.white,),),
                    ),
                  ),
                  SizedBox(height: 25,),
                  // Container(
                  //   padding: EdgeInsets.only(left: 12,top: 20),
                  //   child: Text('Or Sign up with',style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'sans-serif-light'),textAlign: TextAlign.right,)                     ,
                  // ),
                  SizedBox(height: 39,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: Colors.white, // Set the text color here
                          ),
                          onPressed: () {},
                          child: Image.network('https://cdn-icons-png.flaticon.com/128/5968/5968764.png', height: 30,),
                        ),
                      ),
                      SizedBox(width: 30,),
                      SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: Colors.white, // Set the text color here
                          ),  onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MySignUpPage(),),
                          );
                        },
                          child: Image.network('https://cdn-icons-png.flaticon.com/128/281/281764.png', height: 29,),
                        ),
                      ),
                      SizedBox(width: 30,),
                      SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: Colors.white, // Set the text color here
                          ),
                          onPressed: () {},
                          child: Image.network('https://cdn-icons-png.flaticon.com/128/731/731985.png', height: 30,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account?', style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'nexalight'),),
                      SizedBox(width: 50,),

                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text('Log in',style: TextStyle(color: Colors.blue,fontSize: 18),),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



