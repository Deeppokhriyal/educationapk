import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherlogin.dart';
import 'package:educationapk/controllers/signupController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Teacherpanel extends StatefulWidget {
  @override
  State<Teacherpanel> createState() => _TeacherpanelState();
}

class _TeacherpanelState extends State<Teacherpanel> {
  final SignupController controller = Get.put(tag: 'SignupController', SignupController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUpTeacher() async {
    print("DEBUG: Email: '${usernameController.text.trim()}'");
    print("DEBUG: Password: '${passwordController.text.trim()}'");
    print("DEBUG: Selected Branch: '$selectedValue'");
    print("DEBUG: Selected Post: '$selectedPosts'");

    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        selectedValue == null ||
        selectedPosts == null) {
      print("DEBUG: One or more fields are empty!");
      return;
    }

    try {
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      String userId = userCredential.user!.uid;

      // Save data in "users" collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set({
        'email': usernameController.text.trim(),
        'branch': selectedValue,
        'post': selectedPosts,
        'role': 'teacher',
      });

      // Save data in "teachers" collection
      await FirebaseFirestore.instance
          .collection('teachers')
          .doc(userId)
          .set({
        'teacherId': userId,
        'email': usernameController.text.trim(),
        'branch': selectedValue,
        'post': selectedPosts,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print("DEBUG: Teacher Signed Up Successfully");

      // Dismiss the loader
      Navigator.pop(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TeacherLogin()),
      );
    } catch (e) {
      // Dismiss the loader in case of error
      Navigator.pop(context);

      if (e is FirebaseAuthException) {
        print("DEBUG: Firebase Auth Error: ${e.code} - ${e.message}");
      } else if (e is FirebaseException) {
        print("DEBUG: Firestore Error: ${e.code} - ${e.message}");
      } else {
        print("DEBUG: General Error: $e");
      }
    }
  }

  String? selectedPosts;
  String? selectedValue; // Variable to hold the selected branch

  final List<String> items = [
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

  // List of posts for the dropdown
  final List<String> posts = [
    'Head of Department',
    'Lecturer',
    'Guest Teacher',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/blue-curve-frame-template-vector_53876-168163.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 50, 260, 0),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1, left: 30),
            child: Column(children: [
              Text(
                'Welcome !\nDear Teacher\'s',
                style: TextStyle(color: Colors.black, fontSize: 38, fontFamily: 'sans-serif-thin'),
              ),
              Text(
                'Please Create Your Account',
                style: TextStyle(color: Colors.green, fontSize: 18, fontFamily: 'nexalight'),
              ),
            ]),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3, right: 30, left: 30),
              child: Column(
                children: [
                  // Dropdown for Branches
                  DropdownButton<String>(
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontFamily: 'nexalight'),
                    borderRadius: BorderRadius.circular(35),
                    value: selectedValue, // Current selected value
                    hint: Text('Select Your Branch'), // Hint text
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
                  SizedBox(height: 30),
                  // Dropdown for Posts
                  DropdownButton<String>(
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontFamily: 'nexalight'),
                    borderRadius: BorderRadius.circular(35),
                    value: selectedPosts, // Current selected
                    hint: Text('Select Your Post                          '), // Hint text
                    items: posts.map((String post) {
                      return DropdownMenuItem<String>(
                        value: post,
                        child: Text(post),
                      );
                    }).toList(),
                    onChanged: (String? newPosts) {
                      setState(() {
                        selectedPosts = newPosts; // Update the selected value
                      });
                    },
                  ),
                  SizedBox(height: 30,),
                  TextField(style: TextStyle( fontFamily: 'nexalight'),
                    controller: usernameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder( // Unfocused border color
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
                      onPressed: () => signUpTeacher(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Set background color to black
                        padding: EdgeInsets.symmetric(vertical: 15), // Button height
                        textStyle: TextStyle(fontSize: 18, ), // Font size
                      ),
                      child: Text('Sign up',style: TextStyle(color: Colors.white,),),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account?', style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: 'nexalight'),),
                      SizedBox(width: 50,),

                      InkWell(
                        onTap: (){
                         Get.to(TeacherLogin());
                        },
                        child: Text('Log in',style: TextStyle(color: Colors.green,fontSize: 18),),
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

