import 'package:educationapk/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:educationapk/startingpage.dart';

class MyLogin extends StatelessWidget {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/back4.jpg'), // Path to your background image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListView( shrinkWrap: true,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(15, 30, 270, 0),
                          child: Icon(Icons.arrow_back_ios,size: 30,)
                      ),

                      SizedBox(height: 15,),
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
                              TextField(style: TextStyle( fontFamily: 'sans-serif-light'),
                                controller: passwordController,
                                cursorColor: Colors.black,
                                obscureText: true,
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
                              Container(
                                padding: EdgeInsets.only(left: 215,top: 20),
                                child: Text('Forget Password?',style: TextStyle(color: Colors.black,fontSize: 12,fontFamily: 'sans-serif-light'),textAlign: TextAlign.right,)                     ,
                              ),

                              SizedBox(height: 25,),
                              SizedBox(
                                height: 50,
                                width: 450,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black, backgroundColor: Colors.black, // Set the text color here
                                  ),  onPressed: () {
                                    login(context);
                                  // Get.to(()=>MyHomePage());
                                },
                                  child: Text('Login',style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'sans-serif-light'),),
                                ),
                              ),
                              SizedBox(height: 25,),
                              Container(
                                padding: EdgeInsets.only(left: 12,top: 20),
                                child: Text('Or Login with',style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'sans-serif-light'),textAlign: TextAlign.right,)                     ,
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
                                      child: Image.asset('assets/images/facebook.png', height: 30,),
                                    ),
                                  ),
                                  SizedBox(width: 30,),
                                  SizedBox(
                                    height: 46,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black, backgroundColor: Colors.white, // Set the text color here
                                      ),  onPressed: () {},
                                      child: Image.asset('assets/images/search.png', height: 29,),
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
                                      child: Image.asset('assets/images/apple.png', height: 30,),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 80,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t Have an Account?', style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'sans-serif-light'),),
                                  SizedBox(width: 50,),

                                  InkWell(
                                    onTap: () {
                                      Get.to(()=>MySignUpPage());
                                    },
                                    child: Text('Sign Up'),
                                  )
                                ],
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
    );
  }
  void login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString("username");
    String? storedPassword = prefs.getString("password");
    print(storedPassword);
    print(storedUsername);
    if (usernameController.text == storedUsername && passwordController.text == storedPassword) {
      // Navigate to home screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

    }
  }
}