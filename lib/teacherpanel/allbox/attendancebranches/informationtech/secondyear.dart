import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Secondyear extends StatefulWidget {
  @override
  _SecondyearState createState() => _SecondyearState();
}

class _SecondyearState extends State<Secondyear> {
  final List<Map<String, String>> students = [
    {"rollNo": "1", "name": "Prakash Singh"},
    {"rollNo": "2", "name": "Megha Bahukhandi"},
    {"rollNo": "3", "name": "Kavita"},
    {"rollNo": "4", "name": "Vishal Kumar"},
    {"rollNo": "5", "name": "Dheerak Joshi"},
    {"rollNo": "6", "name": "Himanshu Chauhan"},
    {"rollNo": "7", "name": "Jyoti Rani"},
    {"rollNo": "8", "name": "Krishna Kanhaiya Joshi"},
    {"rollNo": "9", "name": "Lakshita Sharma"},
    {"rollNo": "10", "name": "Mayank Singh"},
    {"rollNo": "11", "name": "Rahul Singh Bisht"},
    {"rollNo": "12", "name": "Aman Diktiya"},
    {"rollNo": "13", "name": "Amit Negi"},
    {"rollNo": "14", "name": "Vinita"},
    {"rollNo": "15", "name": "Tanish Negi"},
    {"rollNo": "17", "name": "Harsh Bhatt"},
    {"rollNo": "16", "name": "Himanshu Rawat"},
    {"rollNo": "18", "name": "Rahul Singh Rawat"},
    {"rollNo": "19", "name": "Rajat"},
    {"rollNo": "20", "name": "Saloni Das"},
    {"rollNo": "21", "name": "Saurabh Singh"},
    {"rollNo": "22", "name": "Payal Negi"},
    {"rollNo": "23", "name": "Rahul Chandra"},
    {"rollNo": "24", "name": "Shivank"},
    {"rollNo": "25", "name": "Abhishek Kashyap"},
    {"rollNo": "26", "name": "Paras Kumar"},
    {"rollNo": "27", "name": "Jyoti Sanwal"},
    {"rollNo": "28", "name": "Aarti Mehra"},
    {"rollNo": "29", "name": "Amit Bisht"},
    {"rollNo": "30", "name": "Gaurav Rawat"},
    {"rollNo": "31", "name": "Harsh Ghai"},
    {"rollNo": "32", "name": "Krishna Pal"},
    {"rollNo": "33", "name": "Lalit Kumar"},
    {"rollNo": "34", "name": "Pankaj Kumar"},
    {"rollNo": "35", "name": "Pinky"},
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
        String key = "attendance_second_${student['rollNo']}_$today";
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

    await prefs.setString("attendance_second_${studentRollNo}_$today", status);

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
