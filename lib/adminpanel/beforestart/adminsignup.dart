import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/adminpanel/beforestart/adminlogin.dart';
import 'package:educationapk/teacherpanel/before%20start/teacherlogin.dart';
import 'package:educationapk/controllers/signupController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adminsignup extends StatefulWidget {
  @override
  State<Adminsignup> createState() => _AdminsignupState();
}

class _AdminsignupState extends State<Adminsignup> {
  final SignupController controller = Get.put(SignupController(), tag: 'SignupController');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signUpTeacher() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }
    if (password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters long");
      return;
    }

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'adminId': userId,
        'email': email,
        'role': 'admin',
        'createdAt': FieldValue.serverTimestamp(),
      });

      Navigator.pop(context);
      Get.offAll(TeacherLogin());
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorMessage = "Signup Failed";
      if (e.code == 'email-already-in-use') {
        errorMessage = "This email is already registered";
      } else if (e.code == 'weak-password') {
        errorMessage = "Password should be at least 6 characters";
      }
      Get.snackbar("Signup Failed", errorMessage);
    } catch (e) {
      Navigator.pop(context);
      Get.snackbar("Signup Failed", e.toString());
    }
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
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1, left: 30),
            child: Column(children: [
              Text(
                'Welcome !\nDear Teachers',
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
                  TextField(
                    style: TextStyle(fontFamily: 'nexalight'),
                    controller: emailController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    obscureText: true,
                    style: TextStyle(fontFamily: 'nexalight'),
                    controller: passwordController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => signUpTeacher(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Text('Sign up', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account?', style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'nexalight')),
                      SizedBox(width: 50),
                      InkWell(
                        onTap: () {
                          Get.off(() => AdminLogin());
                        },
                        child: Text('Log in', style: TextStyle(color: Colors.green, fontSize: 18)),
                      ),
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
