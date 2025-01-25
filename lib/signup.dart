import 'package:educationapk/controllers/signupController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'signup page',
      home: MySignUpPage(),
    );
  }
}

class MySignUpPage extends StatelessWidget {

  final SignupController controller=Get.put(tag: 'SignupController',SignupController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back5.jpg'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08,left: 30),
            child: Text('Welcome !\nCreate you Account', style: TextStyle( color: Colors.black, fontSize: 38, fontFamily: 'sans-serif-thin'),),
          ),

          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25,right: 30,left: 30),
              child: Column(
                children: [
                  TextField( cursorColor: Colors.black,style: TextStyle( fontFamily: 'sans-serif-light'),
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

                    cursorColor: Colors.black,
                    obscureText: true,
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
                  TextField(style: TextStyle( fontFamily: 'sans-serif-light'),

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
                  SizedBox(height: 35,),
                  SizedBox(
                    width: double.infinity, // Full width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Set background color to black
                        padding: EdgeInsets.symmetric(vertical: 15), // Button height
                        textStyle: TextStyle(fontSize: 18, ), // Font size
                      ),
                      child: Text('Sign up',style: TextStyle(color: Colors.white,),),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    padding: EdgeInsets.only(left: 12,top: 20),
                    child: Text('Or Sign up with',style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'sans-serif-light'),textAlign: TextAlign.right,)                     ,
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
                          ),  onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MySignUpPage(),),
                          );
                        },
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
                      Text('Already Have an Account?', style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'sans-serif-light'),),
                      SizedBox(width: 50,),

                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text('Log in'),
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