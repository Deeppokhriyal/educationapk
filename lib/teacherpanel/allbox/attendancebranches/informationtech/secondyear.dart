import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Secondyear extends StatefulWidget {
  @override
  _SecondyearState createState() => _SecondyearState();
}

class _SecondyearState extends State<Secondyear> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Prakash Singh", 'status': 'Absent'},
    {"id": 2, "name": "Megha Bahukhandi", 'status': 'Absent'},
    {"id": 3, "name": "Kavita", 'status': 'Absent'},
    {"id": 4, "name": "Vishal Kumar", 'status': 'Absent'},
    {"id": 5, "name": "Dheeraj Joshi", 'status': 'Absent'},
    {"id": 6, "name": "Himanshu Chauhan", 'status': 'Absent'},
    {"id": 7, "name": "Jyoti Rani", 'status': 'Absent'},
    {"id": 8, "name": "Kanhaiya Joshi", 'status': 'Absent'},
    {"id": 9, "name": "Lakshita Sharma", 'status': 'Absent'},
    {"id": 10, "name": "Mayank Singh", 'status': 'Absent'},
    {"id": 11, "name": "Rahul Singh Bisht", 'status': 'Absent'},
    {"id": 12, "name": "Aman Diktiya", 'status': 'Absent'},
    {"id": 13, "name": "Amit Negi", 'status': 'Absent'},
    {"id": 14, "name": "Vinita", 'status': 'Absent'},
    {"id": 15, "name": "Tanish Negi", 'status': 'Absent'},
    {"id": 16, "name": "Himanshu Rawat", 'status': 'Absent'},
    {"id": 17, "name": "Harsh Bhatt", 'status': 'Absent'},
    {"id": 18, "name": "Rahul Singh Rawat", 'status': 'Absent'},
    {"id": 19, "name": "Rajat", 'status': 'Absent'},
    {"id": 20, "name": "Saloni Das", 'status': 'Absent'},
    {"id": 21, "name": "Saurabh Singh", 'status': 'Absent'},
    {"id": 22, "name": "Payal Negi", 'status': 'Absent'},
    {"id": 23, "name": "Rahul Chandra", 'status': 'Absent'},
    {"id": 24, "name": "Shivank", 'status': 'Absent'},
    {"id": 25, "name": "Abhishek Kashyap", 'status': 'Absent'},
    {"id": 26, "name": "Paras Kumar", 'status': 'Absent'},
    {"id": 27, "name": "Jyoti Sanwal", 'status': 'Absent'},
    {"id": 28, "name": "Aarti Mehra", 'status': 'Absent'},
    {"id": 29, "name": "Amit Bisht", 'status': 'Absent'},
    {"id": 30, "name": "Gaurav Rawat", 'status': 'Absent'},
    {"id": 31, "name": "Harsh Ghai", 'status': 'Absent'},
    {"id": 32, "name": "Krishna Pal", 'status': 'Absent'},
    {"id": 33, "name": "Lalit Kumar", 'status': 'Absent'},
    {"id": 34, "name": "Pankaj Kumar", 'status': 'Absent'},
    {"id": 35, "name": "Pinky", 'status': 'Absent'},
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

    await _firestore.collection("attendance2ndyear").doc(todayDate).set({
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
      backgroundColor: Colors.white,
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