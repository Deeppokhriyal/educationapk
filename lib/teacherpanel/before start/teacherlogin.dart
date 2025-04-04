import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/before%20start/startingpage.dart';
import 'package:educationapk/teacherpanel/bottombar/teacherbottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherLogin extends StatefulWidget {
  @override
  _TeacherLoginState createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  final TextEditingController teacherusernameController = TextEditingController();
  final TextEditingController teacherpasswordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _savedCredentials();
  }

  Future<void> _savedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      teacherusernameController.text = prefs.getString("username") ?? "";
      teacherpasswordController.text = prefs.getString("password") ?? "";
      rememberMe = prefs.getBool("rememberMe") ?? false;
    });
  }

  Future<void> loginTeacher(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: teacherusernameController.text.trim(),
        password: teacherpasswordController.text.trim(),

      );

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists && userDoc['role'] == 'teacher') {
        if (rememberMe) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("username", teacherusernameController.text);
          prefs.setString("password", teacherpasswordController.text);
          prefs.setBool("rememberMe", true);
        }
        Get.offAll(()=>Teacherbar());
      } else {
        showError("Not a Teacher Account!");
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
                  gradient: LinearGradient(colors: [Colors.green,Colors.white],
                      begin: Alignment.topRight,
                      end: Alignment.centerLeft
                  ),
                ),
              ),
              ZoomIn(
                duration: Duration(milliseconds: 400),
                child: ListView( shrinkWrap: true,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 30, 310, 0),
                        child: IconButton(onPressed: (){
                          Get.offAll(()=> Starting());
                        }, icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,))
                    ),

                    SizedBox(height: 20,),
                    Container(
                        padding: EdgeInsets.only(right: 30,left: 30),
                        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome\nDear Teacher\'s', style: TextStyle( color: Colors.black, fontSize: 40, fontFamily: 'sans-serif-thin'),),
                            Text('Glad to see you.', style: TextStyle( color: Colors.green, fontSize: 40, fontFamily: 'sans-serif-thin'),),
                          ],
                        )
                    ),
                    SizedBox(height: 40,),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(right: 30,left: 30),
                        child: Column(
                          children: [
                            TextField( cursorColor: Colors.black,style: TextStyle( fontFamily: 'nexalight'),
                              controller: teacherusernameController,
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
                              controller: teacherpasswordController,
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
                                    borderSide: BorderSide(color: Colors.green),// Focused border color
                                    borderRadius: BorderRadius.circular(35)
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
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
                                :SizedBox(height: 35,),
                            SizedBox(
                              height: 50,
                              width: 450,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black, backgroundColor: Colors.green, // Set the text color here
                                ),  onPressed: () => loginTeacher(context),
                                child: Text('Login',style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'sans-serif-light'),),
                              ),
                            ),

                            Divider(height: 50,),

                            Text('Dear Teacher\'s\n'
                                'We Try To Give you Best via This Application.',style: TextStyle(color: Colors.green,fontSize: 18,fontFamily: 'nexalight'),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]
        )
    )
    ;
  }
//   void login(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? storedUsername = prefs.getString("username");
//     String? storedPassword = prefs.getString("password");
//     print(storedPassword);
//     print(storedUsername);
//     if (usernameController.text == storedUsername && passwordController.text == storedPassword) {
//       // Navigate to home screen
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
//
//     }
//   }
}