import 'package:educationapk/allpages/attendance.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firstyear extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {"id": "1", "name": "Aman Kumar", "roll": 101},
    {"id": "2", "name": "Rohan Singh", "roll": 102},
    {"id": "3", "name": "Priya Sharma", "roll": 103},
    {"id": "4", "name": "Ankit Yadav", "roll": 104},
    {"id": "5", "name": "Neha Verma", "roll": 105},
    {"id": "6", "name": "Rajesh Tiwari", "roll": 106},
    {"id": "7", "name": "Kavita Singh", "roll": 107},
    {"id": "8", "name": "Sumit Das", "roll": 108},
    {"id": "9", "name": "Sneha Gupta", "roll": 109},
    {"id": "10", "name": "Vikram Chauhan", "roll": 110},
  ];

  void markAttendance(String studentId, String name, int roll, String status) async {
    String today = DateTime.now().toString().split(" ")[0]; // YYYY-MM-DD

    await FirebaseFirestore.instance
        .collection("attendance")
        .doc(today)
        .collection("students")
        .doc(studentId)
        .set({
      "name": name,
      "roll": roll,
      "status": status,
    });

    print("$name marked as $status");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mark Attendance")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          var student = students[index];

          return ListTile(
            leading: CircleAvatar(child: Text(student["roll"].toString())),
            title: Text(student["name"]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    markAttendance(student["id"], student["name"], student["roll"], "Present");
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Present"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    markAttendance(student["id"], student["name"], student["roll"], "Absent");
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Absent"),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.history),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AttendancePage()));
        },
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Firstyear extends StatefulWidget {
//   @override
//   _FirstyearState createState() => _FirstyearState();
// }
//
// class _FirstyearState extends State<Firstyear> {
//   final List<Map<String, String>> students = [
//     {"rollNo": "1", "name": "Abhishek Patwal"},
//     {"rollNo": "2", "name": "Anjali"},
//     {"rollNo": "3", "name": "Anjali Verma"},
//     {"rollNo": "4", "name": "Anpam Dhyani"},
//     {"rollNo": "5", "name": "Asha"},
//     {"rollNo": "6", "name": "Ashish Rawat"},
//     {"rollNo": "7", "name": "Ayush Kumar"},
//     {"rollNo": "8", "name": "Bharat Singh"},
//     {"rollNo": "9", "name": "Devpratap Singh"},
//     {"rollNo": "10", "name": "Divyanshu Parihar"},
//     {"rollNo": "11", "name": "Isha Chamoli"},
//     {"rollNo": "12", "name": "Kushboo Shukla"},
//     {"rollNo": "13", "name": "Khushi Diwakar"},
//     {"rollNo": "14", "name": "Kuldeep Kumar"},
//     {"rollNo": "15", "name": "Manisha Negi"},
//     {"rollNo": "16", "name": "Mohd Shadab"},
//     {"rollNo": "17", "name": "Muskan"},
//     {"rollNo": "18", "name": "Muskan Maurya"},
//     {"rollNo": "19", "name": "Neeraj Suyal"},
//     {"rollNo": "20", "name": "Nidhi Prabhakar"},
//     {"rollNo": "21", "name": "Nishant"},
//     {"rollNo": "22", "name": "Om Patel"},
//     {"rollNo": "23", "name": "Om Rawat"},
//     {"rollNo": "24", "name": "Pooja"},
//     {"rollNo": "25", "name": "Priya Panwar"},
//     {"rollNo": "26", "name": "Rahul Rawat"},
//     {"rollNo": "27", "name": "Sahiba"},
//     {"rollNo": "28", "name": "Saniya"},
//     {"rollNo": "29", "name": "Saniya Bharadwaj"},
//     {"rollNo": "30", "name": "Shahnawaj"},
//     {"rollNo": "31", "name": "Sher Bahadur"},
//   ];
//
//   Map<String, String> attendanceStatus = {}; // Store attendance per student
//
//   @override
//   void initState() {
//     super.initState();
//     loadAttendanceData();
//   }
//
//   // Load saved attendance from SharedPreferences
//   Future<void> loadAttendanceData() async {
//     final prefs = await SharedPreferences.getInstance();
//     String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//
//     setState(() {
//       for (var student in students) {
//         String key = "attendance_firstyear_${student['rollNo']}_$today";
//         attendanceStatus[student['rollNo']!] =
//             prefs.getString(key) ?? "Not Marked";
//       }
//     });
//   }
//
//   // Save attendance data with the date
//   Future<void> markAttendance(String studentRollNo, String status) async {
//     final prefs = await SharedPreferences.getInstance();
//     String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//
//     setState(() {
//       attendanceStatus[studentRollNo] = status;
//     });
//
//     await prefs.setString("attendance_firstyear_${studentRollNo}_$today", status);
//
//     Get.snackbar(
//       "Attendance",
//       "Student $studentRollNo is marked $status",
//       backgroundColor: status == "Present" ? Colors.green : Colors.red,
//       colorText: Colors.white,
//       snackPosition: SnackPosition.TOP,
//       titleText: Text(
//         "Attendance",
//         style: TextStyle(
//           fontFamily: 'NexaLight',
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       messageText: Text(
//         "Roll no. $studentRollNo is $status in $today",
//         style: TextStyle(
//           fontFamily: 'NexaLight',
//           fontSize: 14,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//
//     return Scaffold(
//       backgroundColor: Colors.green[200],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//         title: Text("Today's Date : $today",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 20),), // Show current date
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(10),
//         itemCount: students.length,
//         itemBuilder: (context, index) {
//           final student = students[index];
//           String status = attendanceStatus[student["rollNo"]!] ?? "Not Marked";
//
//           return Card(
//             elevation: 10,
//             margin: EdgeInsets.symmetric(vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(40),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "${student["rollNo"]}. ${student["name"]!}",
//                     style: TextStyle(
//                       fontFamily: 'Nexaheavy',
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Status: $status",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: status == "Present"
//                           ? Colors.green
//                           : status == "Absent"
//                               ? Colors.red
//                               : Colors.grey,
//                       fontWeight: FontWeight.bold,
//                         fontFamily: 'nexalight'
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           markAttendance(student["rollNo"]!, "Present");
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green),
//                         child: Text("Present",style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           markAttendance(student["rollNo"]!, "Absent");
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red),
//                         child: Text("Absent",style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
