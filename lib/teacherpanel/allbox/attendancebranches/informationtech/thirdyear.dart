// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Thirdyear extends StatefulWidget {
//   @override
//   _ThirdyearState createState() => _ThirdyearState();
// }
//
// class _ThirdyearState extends State<Thirdyear> {
//   final List<Map<String, String>> students = [
//     {"rollNo": "1", "name": "Aditya verma"},
//     {"rollNo": "2", "name": "Ankita Mandal"},
//     {"rollNo": "3", "name": "Ashish Rawat"},
//     {"rollNo": "4", "name": "Ayush Kohli"},
//     {"rollNo": "5", "name": "Bharat Singh Rawat"},
//     {"rollNo": "6", "name": "*Deepak Pokhriyal*"},
//     {"rollNo": "7", "name": "Deepak Rawat"},
//     {"rollNo": "8", "name": "Farheen Saifi"},
//     {"rollNo": "9", "name": "Gaytri Kaushik"},
//     {"rollNo": "10", "name": "Ghanshyam Pargai"},
//     {"rollNo": "11", "name": "Huda Pari"},
//     {"rollNo": "12", "name": "Ishika Kumari Gola"},
//     {"rollNo": "13", "name": "Manisha"},
//     {"rollNo": "14", "name": "Nikhil Chandra"},
//     {"rollNo": "15", "name": "Omkar"},
//     {"rollNo": "17", "name": "Pammi Rautela"},
//     {"rollNo": "16", "name": "Pankaj Rawat"},
//     {"rollNo": "18", "name": "Pawan Kumar"},
//     {"rollNo": "19", "name": "Prashant"},
//     {"rollNo": "20", "name": "Priyanka"},
//     {"rollNo": "21", "name": "Rahul Maindoliya"},
//     {"rollNo": "22", "name": "Raj Bharti"},
//     {"rollNo": "23", "name": "Saloni"},
//     {"rollNo": "24", "name": "Sanjan Rawat"},
//     {"rollNo": "25", "name": "*Shivanshi Mishra*"},
//     {"rollNo": "26", "name": "Shreya Bisht"},
//     {"rollNo": "27", "name": "Akhilesh Rawat"},
//     {"rollNo": "28", "name": "Sudhanshu Joshi"},
//     {"rollNo": "29", "name": "Sumit Singh"},
//     {"rollNo": "30", "name": "Arjun Kumar Mourya"},
//     {"rollNo": "31", "name": "Amit Jaitwal"},
//     {"rollNo": "32", "name": "Sushil Nath"},
//     {"rollNo": "33", "name": "Anuj Prajapati"},
//     {"rollNo": "34", "name": "Suraj Rawat"},
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
// // Load saved attendance from SharedPreferences
//   Future<void> loadAttendanceData() async {
//     final prefs = await SharedPreferences.getInstance();
//     String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//
//     setState(() {
//       for (var student in students) {
//         String key = "attendance_third_${student['rollNo']}_$today";
//         attendanceStatus[student['rollNo']!] =
//             prefs.getString(key) ?? "Not Marked";
//       }
//     });
//   }
//
// // Save attendance data with the date
//   Future<void> markAttendance(String studentRollNo, String status) async {
//     final prefs = await SharedPreferences.getInstance();
//     String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//
//     setState(() {
//       attendanceStatus[studentRollNo] = status;
//     });
//
//     await prefs.setString("attendance_third_${studentRollNo}_$today", status);
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
//                       fontFamily: 'nexalight'
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


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Thirdyear extends StatefulWidget {
  @override
  _ThirdyearState createState() => _ThirdyearState();
}

class _ThirdyearState extends State<Thirdyear> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Aditya Verma", 'status': 'Absent'},
    {"id": 2, "name": "Ankita Mandal", 'status': 'Absent'},
    {"id": 3, "name": "Ashish Rawat", 'status': 'Absent'},
    {"id": 4, "name": "Ayush Kohli", 'status': 'Absent'},
    {"id": 5, "name": "Bharat Singh Rawat", 'status': 'Absent'},
    {"id": 6, "name": "*Deepak Pokhriyal*", 'status': 'Absent'},
    {"id": 7, "name": "Deepak Rawat", 'status': 'Absent'},
    {"id": 8, "name": "Farheen Saifi", 'status': 'Absent'},
    {"id": 9, "name": "Gaytri Kaushik", 'status': 'Absent'},
    {"id": 10, "name": "Ghanshyam Pargai", 'status': 'Absent'},
    {"id": 11, "name": "Huda Pari", 'status': 'Absent'},
    {"id": 12, "name": "Ishika Kumari Gola", 'status': 'Absent'},
    {"id": 13, "name": "Manisha", 'status': 'Absent'},
    {"id": 14, "name": "Nikhil Chandra", 'status': 'Absent'},
    {"id": 15, "name": "Omkar", 'status': 'Absent'},
    {"id": 16, "name": "Pankaj Rawat", 'status': 'Absent'},
    {"id": 17, "name": "Pammi Rautela", 'status': 'Absent'},
    {"id": 18, "name": "Pawan Kumar", 'status': 'Absent'},
    {"id": 19, "name": "Prashant", 'status': 'Absent'},
    {"id": 20, "name": "Priyanka", 'status': 'Absent'},
    {"id": 21, "name": "Rahul Maindoliya", 'status': 'Absent'},
    {"id": 22, "name": "Raj Bharti", 'status': 'Absent'},
    {"id": 23, "name": "Saloni", 'status': 'Absent'},
    {"id": 24, "name": "Sanjan Rawat", 'status': 'Absent'},
    {"id": 25, "name": "*Shivanshi Mishra*", 'status': 'Absent'},
    {"id": 26, "name": "Shreya Bisht", 'status': 'Absent'},
    {"id": 27, "name": "Akhilesh Rawat", 'status': 'Absent'},
    {"id": 28, "name": "Sudhanshu Joshi", 'status': 'Absent'},
    {"id": 29, "name": "Sumit Singh", 'status': 'Absent'},
    {"id": 30, "name": "Arjun Kumar Mourya", 'status': 'Absent'},
    {"id": 31, "name": "Amit Jaitwal", 'status': 'Absent'},
    {"id": 32, "name": "Sushil Nath", 'status': 'Absent'},
    {"id": 33, "name": "Anuj Prajapati", 'status': 'Absent'},
    {"id": 34, "name": "Suraj Rawat", 'status': 'Absent'},
  ];


  // Function to update attendance in Firestore
  Future<void> markAttendance() async {
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    List<Map<String, dynamic>> attendanceList = students.map((student) {
      return {
        "id": student['id'],
        "name": student['name'],
        "status": student['status']
      };
    }).toList();

    await _firestore.collection("attendance3rdyear").doc(todayDate).set({
      "attendance": attendanceList,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Attendance saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("Today's Date: $today", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20)),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ✅ Ensure ID is properly converted to string before displaying
                      Text(
                        "${students[index]['id'].toString()}. ${students[index]['name']}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'nexaheavy',
                          color: students[index]['status'] == 'Present'
                              ? Colors.green
                              : students[index]['status'] == 'Absent'
                              ? Colors.red
                              : Colors.black, // ✅ Default to black if no selection
                        ),
                      ),

                      // ✅ Dropdown for attendance selection
                      DropdownButton<String>(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'nexalight'
                        ),
                        borderRadius: BorderRadius.circular(35), // ✅ Rounded corners
                        hint: Text(
                          'Select',
                          style: TextStyle(
                              fontFamily: 'nexalight',
                              color: Colors.black,
                              fontSize: 18
                          ),
                        ),
                        value: students[index]['status'] == "Present" || students[index]['status'] == "Absent"
                            ? students[index]['status']
                            : null, // ✅ Initially set to null for hint to appear
                        items: ["Present", "Absent"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            students[index]['status'] = newValue!;
                          });
                        },
                      ),


                    ],
                  ),
                );
              },

            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: markAttendance,
            child: Text("Submit Attendance",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 19,color: Colors.blue),),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}