import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Mechthird extends StatefulWidget {
  const Mechthird({super.key});

  @override
  _MechthirdState createState() => _MechthirdState();
}

class _MechthirdState extends State<Mechthird> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Aditya Dubey", "status": "Absent"},
    {"id": 2, "name": "Amandeep", "status": "Absent"},
    {"id": 3, "name": "Ansh Kumar", "status": "Absent"},
    {"id": 4, "name": "Anshul Negi", "status": "Absent"},
    {"id": 5, "name": "Avneesh Kumar", "status": "Absent"},
    {"id": 6, "name": "Chetan Belwal", "status": "Absent"},
    {"id": 7, "name": "Deepak Kumar", "status": "Absent"},
    {"id": 8, "name": "Faizan Ali", "status": "Absent"},
    {"id": 9, "name": "Harshit Sherawat", "status": "Absent"},
    {"id": 10, "name": "Himanshu Shaily", "status": "Absent"},
    {"id": 11, "name": "Himanshu Upadhyay", "status": "Absent"},
    {"id": 12, "name": "Jiten Bajetha", "status": "Absent"},
    {"id": 13, "name": "Jitendra Negi", "status": "Absent"},
    {"id": 14, "name": "Kamal Singh Supyal", "status": "Absent"},
    {"id": 15, "name": "Krishna Kumar", "status": "Absent"},
    {"id": 16, "name": "Nandni", "status": "Absent"},
    {"id": 17, "name": "Narender Singh", "status": "Absent"},
    {"id": 18, "name": "Neha Rawat", "status": "Absent"},
    {"id": 19, "name": "Nikhil Rawat", "status": "Absent"},
    {"id": 20, "name": "Nitin Chauhan", "status": "Absent"},
    {"id": 21, "name": "Nitin Singh", "status": "Absent"},
    {"id": 22, "name": "Pankaj Singh", "status": "Absent"},
    {"id": 23, "name": "Piyush", "status": "Absent"},
    {"id": 24, "name": "Priyanshi Gola", "status": "Absent"},
    {"id": 25, "name": "Rahul Kothari", "status": "Absent"},
    {"id": 26, "name": "Ravi", "status": "Absent"},
    {"id": 27, "name": "Ravi Rawat", "status": "Absent"},
    {"id": 28, "name": "Ritik Kumar", "status": "Absent"},
    {"id": 29, "name": "Sachin Kumar", "status": "Absent"},
    {"id": 30, "name": "Sapna Chand", "status": "Absent"},
    {"id": 31, "name": "Shankar Singh Bhandari", "status": "Absent"},
    {"id": 32, "name": "Sumit Kumar", "status": "Absent"},
    {"id": 33, "name": "Tanuj Rana", "status": "Absent"},
    {"id": 34, "name": "Tushar Sarkar", "status": "Absent"},
    {"id": 35, "name": "Ujjawal Bisht", "status": "Absent"},
    {"id": 36, "name": "Vipin Joshi", "status": "Absent"},
    {"id": 37, "name": "Amit Budhani", "status": "Absent"},
    {"id": 38, "name": "Sawan Singh Tadiyal", "status": "Absent"},
    {"id": 39, "name": "Rohit Singh Bisht", "status": "Absent"},
    {"id": 40, "name": "Deepshikha Mehar", "status": "Absent"},
    {"id": 41, "name": "Ashish Kumar Pandey", "status": "Absent"},
    {"id": 42, "name": "Deepak Kumar(ITI)", "status": "Absent"},
    {"id": 43, "name": "Deepak Kumar(L.E.)", "status": "Absent"},
    {"id": 44, "name": "Krishna Jadli", "status": "Absent"},
    {"id": 45, "name": "Ravindra Singh", "status": "Absent"},
    {"id": 46, "name": "Abhishek Kumar", "status": "Absent"},
    {"id": 47, "name": "Sagar Pandey", "status": "Absent"},
    {"id": 48, "name": "Mohit Panth", "status": "Absent"}
  ];

  // Function to update attendance in Firestore
  Future<void> markAttendance() async {
    setState(() {
      isLoading = true; // ✅ Show loader
    });

    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    List<Map<String, dynamic>> attendanceList = students.map((student) {
      return {
        "id": student['id'],
        "name": student['name'],
        "status": student['status']
      };
    }).toList();

    try {
      await _firestore.collection("attendance3rdyear").doc(todayDate).set({
        "attendance": attendanceList,
      });

      // ✅ Beautiful Green SnackBar for Success

      showAwesomeSnackBarUp(context, "Attendance submitted successfully!", true);

    } catch (e) {
      // ❌ Red SnackBar for Errors
      showAwesomeSnackBarUp(context, "Error Saving Attendance", false);


    } finally {
      setState(() {
        isLoading = false; // ✅ Hide loader after submission
      });
    }
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
          isLoading
              ? SpinKitWave(
            color: Colors.lightBlue,
            size: 50.0,
          )
              :ElevatedButton(
            onPressed: markAttendance,
            child: Text("Submit Attendance",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 19,color: Colors.blue),),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}