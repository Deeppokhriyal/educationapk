import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Thirdyear extends StatefulWidget {
  @override
  _ThirdyearState createState() => _ThirdyearState();
}

class _ThirdyearState extends State<Thirdyear> {
  final List<Map<String, String>> students = [
    {"rollNo": "1", "name": "Aditya verma"},
    {"rollNo": "2", "name": "Ankita Mandal"},
    {"rollNo": "3", "name": "Ashish Rawat"},
    {"rollNo": "4", "name": "Ayush Kohli"},
    {"rollNo": "5", "name": "Bharat Singh Rawat"},
    {"rollNo": "6", "name": "*Deepak Pokhriyal*"},
    {"rollNo": "7", "name": "Deepak Rawat"},
    {"rollNo": "8", "name": "Farheen Saifi"},
    {"rollNo": "9", "name": "Gaytri Kaushik"},
    {"rollNo": "10", "name": "Ghanshyam Pargai"},
    {"rollNo": "11", "name": "Huda Pari"},
    {"rollNo": "12", "name": "Ishika Kumari Gola"},
    {"rollNo": "13", "name": "Manisha"},
    {"rollNo": "14", "name": "Nikhil Chandra"},
    {"rollNo": "15", "name": "Omkar"},
    {"rollNo": "17", "name": "Pammi Rautela"},
    {"rollNo": "16", "name": "Pankaj Rawat"},
    {"rollNo": "18", "name": "Pawan Kumar"},
    {"rollNo": "19", "name": "Prashant"},
    {"rollNo": "20", "name": "Priyanka"},
    {"rollNo": "21", "name": "Rahul Maindoliya"},
    {"rollNo": "22", "name": "Raj Bharti"},
    {"rollNo": "23", "name": "Saloni"},
    {"rollNo": "24", "name": "Sanjan Rawat"},
    {"rollNo": "25", "name": "*Shivanshi Mishra*"},
    {"rollNo": "26", "name": "Shreya Bisht"},
    {"rollNo": "27", "name": "Akhilesh Rawat"},
    {"rollNo": "28", "name": "Sudhanshu Joshi"},
    {"rollNo": "29", "name": "Sumit Singh"},
    {"rollNo": "30", "name": "Arjun Kumar Mourya"},
    {"rollNo": "31", "name": "Amit Jaitwal"},
    {"rollNo": "32", "name": "Sushil Nath"},
    {"rollNo": "33", "name": "Anuj Prajapati"},
    {"rollNo": "34", "name": "Suraj Rawat"},
  ];

  Map<String, String> attendanceStatus = {}; // Store attendance per student

  @override
  void initState() {
    super.initState();
    loadAttendanceData();
  }

// Load saved attendance from SharedPreferences
  Future<void> loadAttendanceData() async {
    final prefs = await SharedPreferences.getInstance();
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    setState(() {
      for (var student in students) {
        String key = "attendance_third_${student['rollNo']}_$today";
        attendanceStatus[student['rollNo']!] =
            prefs.getString(key) ?? "Not Marked";
      }
    });
  }

// Save attendance data with the date
  Future<void> markAttendance(String studentRollNo, String status) async {
    final prefs = await SharedPreferences.getInstance();
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    setState(() {
      attendanceStatus[studentRollNo] = status;
    });

    await prefs.setString("attendance_third_1${studentRollNo}_$today", status);

    Get.snackbar(
      "Attendance",
      "Student $studentRollNo is marked $status",
      backgroundColor: status == "Present" ? Colors.green : Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      titleText: Text(
        "Attendance",
        style: TextStyle(
          fontFamily: 'NexaLight',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        "Roll no. $studentRollNo is $status in $today",
        style: TextStyle(
          fontFamily: 'NexaLight',
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("Today's Date : $today",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 20),), // Show current date
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          String status = attendanceStatus[student["rollNo"]!] ?? "Not Marked";

          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${student["rollNo"]}. ${student["name"]!}",
                    style: TextStyle(
                      fontFamily: 'Nexaheavy',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Status: $status",
                    style: TextStyle(
                      fontSize: 16,
                      color: status == "Present"
                          ? Colors.green
                          : status == "Absent"
                              ? Colors.red
                              : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'nexalight'
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          markAttendance(student["rollNo"]!, "Present");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text("Present",style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          markAttendance(student["rollNo"]!, "Absent");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text("Absent",style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
