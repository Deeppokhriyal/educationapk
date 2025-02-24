import 'package:educationapk/teacherpanel/allbox/attendancebranches/informationtech/firstyear.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/informationtech/secondyear.dart';
import 'package:educationapk/teacherpanel/allbox/attendancebranches/informationtech/thirdyear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Attendance Register',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25),),
    bottom: TabBar(
    labelColor: Colors.blueAccent,
    indicatorColor: Colors.blueAccent,
    labelStyle: TextStyle(
    fontFamily: 'nexaheavy', // Custom font
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    unselectedLabelColor: Colors.black , // Color for inactive tabs
    unselectedLabelStyle: TextStyle(
    fontFamily: 'Nexalight', // Custom font
    fontSize: 15,
    ),
    tabs: [
    Tab(text: '1st Year'),
    Tab(text: '2nd Year'),
    Tab(text: '3rd Year'),
    ],
    ),),
        body: TabBarView(
          children: [
            Firstyear(),
            Secondyear(),
            Thirdyear(),
          ],
        ),
    floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AttendanceHistoryScreen());
          },
          child: Icon(Icons.edit_calendar,color: Colors.lightBlueAccent,size: 35,),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}



class AttendanceHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance History")),
      body: Center(child: Text("Attendance history will be shown here.")),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AttendanceScreen extends StatelessWidget {
//   final List<Map<String, String>> students = [

//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: students.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Attendance Register",style: TextStyle(fontSize: 26,fontFamily: 'nexaheavy'),),
//           bottom: TabBar(
//             isScrollable: true,
//             labelStyle: TextStyle(fontFamily: 'nexalight', fontSize: 16, fontWeight: FontWeight.bold),
//             tabs: students.map((student) => Tab(text: "Roll No: ${student['rollNo']}")).toList(),
//           ),
//         ),
//         body: TabBarView(
//           children: students.map((student) => AttendancePage(student: student)).toList(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Get.to(() => AttendanceHistoryScreen());
//           },
//           child: Icon(Icons.edit_calendar,color: Colors.lightBlueAccent,size: 35,),
//           backgroundColor: Colors.black,
//         ),
//       ),
//     );
//   }
// }
//
// class AttendancePage extends StatelessWidget {
//   final Map<String, String> student;
//
//   AttendancePage({required this.student});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Roll No: ${student['rollNo']}",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'nexalight'),
//           ),
//           SizedBox(height: 10),
//           Text(
//             "${student['name']}",
//             style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,fontFamily: 'nexalight'),
//           ),
//           SizedBox(height: 120),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Mark as Present
//                   Get.snackbar(
//                     "Attendance", "${student['name']} marked Present",
//                     backgroundColor: Colors.green,
//                     colorText: Colors.white,
//                     snackPosition: SnackPosition.TOP,
//                     titleText: Text(
//                       "Attendance",
//                       style: TextStyle(
//                         fontFamily: 'nexalight',  // Custom font
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     messageText: Text(
//                       "${student['name']} marked Present",
//                       style: TextStyle(
//                         fontFamily: 'nexalight',  // Custom font
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                     ),
//                   );
//
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: Text("Present",style: TextStyle(fontFamily: 'nexalight',fontSize: 20,color: Colors.white)),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Mark as Absent
//                   Get.snackbar(
//                     "Attendance", "${student['name']} marked Absent",
//                     backgroundColor: Colors.red,
//                     colorText: Colors.white,
//                     snackPosition: SnackPosition.TOP,
//                     titleText: Text(
//                       "Attendance",
//                       style: TextStyle(
//                         fontFamily: 'NexaLight',  // Custom font
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     messageText: Text(
//                       "${student['name']} marked Absent",
//                       style: TextStyle(
//                         fontFamily: 'NexaLight',  // Custom font
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                 child: Text("Absent",style: TextStyle(fontFamily: 'nexalight',fontSize: 20,color: Colors.white),),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Placeholder for Attendance History Screen
