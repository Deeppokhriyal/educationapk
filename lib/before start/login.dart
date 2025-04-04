import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/adminpanel/beforestart/adminlogin.dart';
import 'package:educationapk/before%20start/signup.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:educationapk/before%20start/startingpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString("username") ?? "";
      passwordController.text = prefs.getString("password") ?? "";
      rememberMe = prefs.getBool("rememberMe") ?? false;
    });
  }

  Future<void> loginStudent(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!userCredential.user!.emailVerified) {
        showError("Please verify your email first!");
        setState(() => isLoading = false);
        await FirebaseAuth.instance.signOut();  // Logout the user if email not verified
        return;
      }

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists && userDoc['role'] == 'student') {
        if (rememberMe) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("username", usernameController.text);
          prefs.setString("password", passwordController.text);
          prefs.setBool("rememberMe", true);
        }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else {
        showError("Not a Student Account!");
      }
    } catch (e) {
      showError("Invalid Email or Password");
    }
    setState(() => isLoading = false);
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
                      gradient: LinearGradient(colors: [Colors.lightBlueAccent,Colors.white],
                      begin: Alignment.topRight,
                        end: Alignment.centerLeft
                      )
                    ),
                  ),
                  Center(
                    child: ZoomIn(
                      duration: Duration(milliseconds: 400),
                      child: ListView( shrinkWrap: true,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 30,left: 30),
                            child: Text('Welcome\nGlad to see you.', style: TextStyle( color: Colors.black, fontSize: 40, fontFamily: 'sans-serif-thin'),),
                          ),
                          SizedBox(height: 20,),
                          SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(right: 30,left: 30),
                              child: Column(
                                children: [
                                  TextField( cursorColor: Colors.black,style: TextStyle( fontFamily: 'sans-serif-light'),
                                    controller: usernameController,
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
                                    cursorColor: Colors.black,
                                    obscureText:!isPasswordVisible,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[100],
                                      hintText: 'Enter your Password',
                                      suffixIcon: IconButton(
                                        icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                                        onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                                      ),
                                      border: OutlineInputBorder( // Unfocused border color
                                          borderRadius: BorderRadius.circular(35)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blue),// Focused border color
                                          borderRadius: BorderRadius.circular(35)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: rememberMe,
                                        onChanged: (value) => setState(() => rememberMe = value!),
                                        activeColor: Colors.green,
                                      ),
                                      Text("Remember Me",style: TextStyle(fontFamily: 'nexalight'),)
                                    ],
                                  ),
                                  isLoading
                                      ? SpinKitWave(
                                    color: Colors.blue,  // Change color as needed
                                    size: 30.0,          // Adjust size
                                  )
                                  :SizedBox(height: 15,),
                                  SizedBox(
                                    height: 50,
                                    width: 450,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black, backgroundColor: Colors.black, // Set the text color here
                                      ),
                                      // onPressed: (){
                                      //   Get.to(()=>MyHomePage());
                                      // },
                                      onPressed: () => loginStudent(context),
                                      child: Text('Login',style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'sans-serif-light'),),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  SizedBox(
                                    height: 50,
                                    width: 450,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
                                      ),  onPressed: () {
                                      Get.to(MySignUpPage());
                                      // Get.to(()=>MyHomePage());
                                    },
                                      child: Text('Sign up',style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'sans-serif-light'),),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    padding: EdgeInsets.only(left: 12,top: 20),
                                    child: Text('Or Login with',style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'nexalight'),textAlign: TextAlign.right,)                     ,
                                  ),

                                  SizedBox(height: 40,),

                                  SizedBox(
                                    height: 50,
                                    width: 450,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black, backgroundColor: Colors.green, // Set the text color here
                                      ),  onPressed: () {
                                      Get.to(TeacherLogin());
                                    },
                                      child: Text('Teacher Panel',style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'sans-serif-light'),),
                                    ),
                                  ), SizedBox(height: 35,),

                                  SizedBox(
                                    height: 50,
                                    width: 450,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black, backgroundColor: Colors.blueGrey // Set the text color here
                                      ),  onPressed: () {
                                      Get.to(AdminLogin());
                                    },
                                      child: Text('Admin Panel',style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'sans-serif-light'),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
            )
        )
    ;
  }
}

