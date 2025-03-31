import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Civilthird extends StatefulWidget {
  const Civilthird({super.key});

  @override
  _CivilthirdState createState() => _CivilthirdState();
}

class _CivilthirdState extends State<Civilthird> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Abhishek Shrivastav", "status": "Absent"},
    {"id": 2, "name": "Akhil Rawat", "status": "Absent"},
    {"id": 3, "name": "Ashish Bhatt", "status": "Absent"},
    {"id": 4, "name": "Ayush Oli", "status": "Absent"},
    {"id": 5, "name": "Chanchal", "status": "Absent"},
    {"id": 6, "name": "Chitransh Saxena", "status": "Absent"},
    {"id": 7, "name": "Dhruv Gola", "status": "Absent"},
    {"id": 8, "name": "Disha", "status": "Absent"},
    {"id": 9, "name": "Diya Kukreti", "status": "Absent"},
    {"id": 10, "name": "Fardeen", "status": "Absent"},
    {"id": 11, "name": "Himanshu Rana", "status": "Absent"},
    {"id": 12, "name": "Kanchan", "status": "Absent"},
    {"id": 13, "name": "Kumkum Pant", "status": "Absent"},
    {"id": 14, "name": "Lokesh Singh Aeri", "status": "Absent"},
    {"id": 15, "name": "Manish Rawat", "status": "Absent"},
    {"id": 16, "name": "Manthan Joshi", "status": "Absent"},
    {"id": 17, "name": "Mohd Arsh", "status": "Absent"},
    {"id": 18, "name": "Mohd Uvesh", "status": "Absent"},
    {"id": 19, "name": "Mukesh Kumar", "status": "Absent"},
    {"id": 20, "name": "Muskan", "status": "Absent"},
    {"id": 21, "name": "Nakul Kumar", "status": "Absent"},
    {"id": 22, "name": "Neeraj Suyal", "status": "Absent"},
    {"id": 23, "name": "Nikhil Kumar", "status": "Absent"},
    {"id": 24, "name": "Pradhuman Chandra", "status": "Absent"},
    {"id": 25, "name": "Prashant Bhatt", "status": "Absent"},
    {"id": 26, "name": "Prashant Raj", "status": "Absent"},
    {"id": 27, "name": "Priyanka", "status": "Absent"},
    {"id": 28, "name": "Priyanshu Rawat", "status": "Absent"},
    {"id": 29, "name": "Priyanshu Singh", "status": "Absent"},
    {"id": 30, "name": "Rohit Kumar", "status": "Absent"},
    {"id": 31, "name": "Saksham Tamta", "status": "Absent"},
    {"id": 32, "name": "Shivam Kumar", "status": "Absent"},
    {"id": 33, "name": "Taneesha Gola", "status": "Absent"},
    {"id": 34, "name": "Tejpal Singh", "status": "Absent"},
    {"id": 35, "name": "Vishal Kandari", "status": "Absent"},
    {"id": 36, "name": "Yashpal Chauhan", "status": "Absent"},
    {"id": 37, "name": "Deepanshu Sharma", "status": "Absent"},
    {"id": 38, "name": "Adeeb Zaid", "status": "Absent"},
    {"id": 39, "name": "Lalit Sati", "status": "Absent"},
    {"id": 40, "name": "Piyush Kumar", "status": "Absent"},
    {"id": 41, "name": "Yuvank Chauhan", "status": "Absent"},
    {"id": 42, "name": "Mohd Rihan Noori", "status": "Absent"},
    {"id": 43, "name": "Siya", "status": "Absent"},
    {"id": 44, "name": "Rahul Singh Dhanik", "status": "Absent"},
    {"id": 45, "name": "Virendra Singh", "status": "Absent"},
    {"id": 46, "name": "Himanshu Bangwal", "status": "Absent"},
    {"id": 47, "name": "Radhika", "status": "Absent"},
    {"id": 48, "name": "Harvansh Kumar Gangwar", "status": "Absent"},
    {"id": 49, "name": "Devesh Kumar", "status": "Absent"},
    {"id": 50, "name": "Farman Ali", "status": "Absent"}
  ]
  ;

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
      await _firestore.collection("Civilthird").doc(todayDate).set({
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
              : ElevatedButton(
            onPressed: markAttendance,
            child: Text("Submit Attendance",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 19,color: Colors.blue),),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}