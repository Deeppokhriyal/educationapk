import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/adminpanel/adminhome.dart';
import 'package:educationapk/adminpanel/adminsignup.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController adminusernameController = TextEditingController();
  final TextEditingController adminpasswordController = TextEditingController();

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
      adminusernameController.text = prefs.getString("username") ?? "";
      adminpasswordController.text = prefs.getString("password") ?? "";
      rememberMe = prefs.getBool("rememberMe") ?? false;
    });
  }

  Future<void> loginAdmin(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: adminusernameController.text.trim(),
        password: adminpasswordController.text.trim(),
      );

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')  // Change to 'admins' if necessary
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists && userDoc['role'] == 'admin') {
        if (rememberMe) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("username", adminusernameController.text);
          prefs.setString("password", adminpasswordController.text);
          prefs.setBool("rememberMe", true);
        }
        Get.offAll(() => Adminhome());  // Navigate to Admin Home
      } else {
        showError("Not an Admin Account!");
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
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 30, 310, 0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => MyLogin()));
                          },
                          icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black,)
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome\nDear Admin', style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: 'sans-serif-thin'),),
                          Text('Glad to see you.', style: TextStyle(
                              color: Colors.green,
                              fontSize: 40,
                              fontFamily: 'sans-serif-thin'),),
                        ],
                      )
                  ),
                  SizedBox(height: 40,),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: Column(
                        children: [
                          TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(fontFamily: 'nexalight'),
                            controller: adminusernameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextField(
                            style: TextStyle(fontFamily: 'nexalight'),
                            controller: adminpasswordController,
                            cursorColor: Colors.black,
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              suffixIcon: IconButton(
                                icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                                onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(35)),
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
                              Text("Remember Me", style: TextStyle(fontFamily: 'nexalight'),)
                            ],
                          ),
                          isLoading
                              ? CircularProgressIndicator()
                              : SizedBox(height: 35,),
                          SizedBox(
                            height: 50,
                            width: 450,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: () => loginAdmin(context),
                              child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 30,),
                          SizedBox(
                            height: 50,
                            width: 450,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                              ),
                              onPressed: () { Get.to(() => Adminsignup());},
                              child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                          Divider(height: 50,),
                          Text('Dear Admin\n'
                              'We Try To Give you Best via This Application.',
                            style: TextStyle(color: Colors.green, fontSize: 18, fontFamily: 'nexalight'),),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]
        )
    );
  }
}
