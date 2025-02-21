import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/teacherpanel/homepage.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherpanel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherLogin extends StatefulWidget {
  @override
  _TeacherLoginState createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false;

  Future<void> loginTeacher(BuildContext context) async {
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

      if (userDoc.exists && userDoc['role'] == 'teacher') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeacherHome()));
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
                  image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-vector/simple-green-gradient-background-vector-business_53876-174936.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                    // Path to your background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView( shrinkWrap: true,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 310, 0),
                      child: IconButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Teacherpanel()));
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
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 215,top: 20),
                            child: Text('Forget Password?',style: TextStyle(color: Colors.black,fontSize: 12,fontFamily: 'nexalight'),textAlign: TextAlign.right,)                     ,
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

