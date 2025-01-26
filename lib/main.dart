// import 'package:educationapk/login.dart';
// import 'package:educationapk/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Correctly initialize SharedPreferences
//   await SharedPreferences.getInstance();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: 'login',
//       routes: {
//         'login': (context) => MySignUpPage(),
//       },
//     );
//   }
// }
import 'package:educationapk/login.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login':(context) => MyLogin(),
    },
  ));
}