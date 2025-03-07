import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/before%20start/signup.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherotp.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherpanel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                      image: DecorationImage(
                        image:
                        NetworkImage('https://img.freepik.com/free-vector/abstract-colorful-low-poly-triangle-shapes_361591-4115.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                        // Path to your background image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListView( shrinkWrap: true,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 30, 310, 0),
                          child: Icon(Icons.arrow_back_ios,size: 30,)
                      ),

                      SizedBox(height: 20,),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      // Get.to(OtpVerificationPage());
                                    },
                                      child: Text('Forget Password?',style: TextStyle(color: Colors.black,fontSize: 13,fontFamily: 'nexaheavy'),textAlign: TextAlign.right,)),
                                ],
                              ),
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
                                  ? CircularProgressIndicator()
                              :SizedBox(height: 15,),
                              SizedBox(
                                height: 50,
                                width: 450,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black, backgroundColor: Colors.black, // Set the text color here
                                  ),  onPressed: () => loginStudent(context),
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
                                      onPressed: () {
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
                              SizedBox(height: 40,),

                              SizedBox(
                                height: 50,
                                width: 450,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black, backgroundColor: Colors.green, // Set the text color here
                                  ),  onPressed: () {
                                  Get.to(Teacherpanel());
                                  // Get.to(()=>MyHomePage());
                                },
                                  child: Text('Teacher Panel',style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'sans-serif-light'),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]
            )
        )
    ;
  }
}

