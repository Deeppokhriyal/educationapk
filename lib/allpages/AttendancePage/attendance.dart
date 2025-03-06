// import 'package:animate_do/animate_do.dart';
// import 'package:educationapk/allpages/AttendancePage/it/itfirstyear.dart';
// import 'package:educationapk/allpages/AttendancePage/it/itsecondyear.dart';
// import 'package:educationapk/allpages/AttendancePage/it/itthirdyear.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class AttendanceHistory extends StatelessWidget {
//   const AttendanceHistory({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         title: Text('Attendance History',style: TextStyle(fontFamily: 'nexalight',fontSize: 25),),
//       ),
//
//       body:
//
//       Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SlideInRight(
//               child: SizedBox(
//                 height: 70,
//                 width: 200,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
//                   ),  onPressed: () {
//                   Get.to(Itfirstyear());
//                   // Get.to(()=>MyHomePage());
//                 },
//                   child: Text('I.T 1st Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
//                 ),
//               ),
//             ),
//             SizedBox(height: 80,),
//             SlideInLeft(
//               child: SizedBox(
//                 height: 70,
//                 width: 200,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
//                   ),  onPressed: () {
//                   Get.to(Itsecondyear());
//                   // Get.to(()=>MyHomePage());
//                 },
//                   child: Text('I.T 2nd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
//                 ),
//               ),
//             ),
//             SizedBox(height: 80,),
//             SlideInRight(
//               child: SizedBox(
//                 height: 70,
//                 width: 200,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black, backgroundColor: Colors.lightBlueAccent, // Set the text color here
//                   ),  onPressed: () {
//                   Get.to(Itthirdyear());
//                   // Get.to(()=>MyHomePage());
//                 },
//                   child: Text('I.T 3rd Year',style: TextStyle(color: Colors.white, fontSize: 23,fontFamily: 'nexaheavy'),),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/allpages/AttendancePage/cs/attendancecs.dart';
import 'package:educationapk/allpages/AttendancePage/it/attendancepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AttendanceHistory extends StatefulWidget {
  @override
  _AttendanceHistoryState createState() => _AttendanceHistoryState();
}

class _AttendanceHistoryState extends State<AttendanceHistory> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? userBranch; // Teacher ki branch store karne ke liye

  @override
  void initState() {
    super.initState();
    getUserBranch(); // 🔥 Firestore se teacher ka branch fetch karne ka function
  }

  Future<void> getUserBranch() async {
    User? user = _auth.currentUser; // 🔥 Firebase se logged-in user ka UID le rahe hain

    if (user != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection("users").doc(user.uid).get();

      if (userDoc.exists) {
        setState(() {
          userBranch = userDoc["branch"]; // 🔥 Firestore se branch ka data le rahe hain
        });
      }
    }
  }

  // 🔥 Navigation function jo teacher ki branch ke according page open karega
  void navigateToAttendance() {
    if (userBranch == "IT") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AttendanceIT()));
    } else if (userBranch == "CSE") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AttendanceCSE()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Branch not assigned!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Branch Navigation")),
      body: Center(
        child: userBranch == null
            ? CircularProgressIndicator() // 🔄 Jab tak data fetch ho raha hai
            : ElevatedButton(
          onPressed: navigateToAttendance,
          child: Text("Go to $userBranch Attendance"),
        ),
      ),
    );
  }
}
