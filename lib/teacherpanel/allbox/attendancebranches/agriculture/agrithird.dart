import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Agrithird extends StatefulWidget {
  const Agrithird({super.key});

  @override
  _AgrithirdState createState() => _AgrithirdState();
}

class _AgrithirdState extends State<Agrithird> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Tushar Bhatnagar", "status": "Absent"},
    {"id": 2, "name": "Gaurangi Agarwal", "status": "Absent"},
    {"id": 3, "name": "Abhishek Rawat", "status": "Absent"},
    {"id": 4, "name": "Aditya S. Negi", "status": "Absent"},
    {"id": 5, "name": "Akshit Kumar", "status": "Absent"},
    {"id": 6, "name": "Aman S. Rawat", "status": "Absent"},
    {"id": 7, "name": "Anmol Sharma", "status": "Absent"},
    {"id": 8, "name": "Anuj Mehra", "status": "Absent"},
    {"id": 9, "name": "Arpit Joshi", "status": "Absent"},
    {"id": 10, "name": "Deeksha", "status": "Absent"},
    {"id": 11, "name": "Devanshu", "status": "Absent"},
    {"id": 12, "name": "Himanshu", "status": "Absent"},
    {"id": 13, "name": "Jatin Tomar", "status": "Absent"},
    {"id": 14, "name": "Kaniska Rawat", "status": "Absent"},
    {"id": 15, "name": "Kavya Bhatnagar", "status": "Absent"},
    {"id": 16, "name": "Khushbuo", "status": "Absent"},
    {"id": 17, "name": "Lalit Sharma", "status": "Absent"},
    {"id": 18, "name": "Laxman Singh", "status": "Absent"},
    {"id": 19, "name": "Laxmi", "status": "Absent"},
    {"id": 20, "name": "Mahaveer Singh", "status": "Absent"},
    {"id": 21, "name": "Manish", "status": "Absent"},
    {"id": 22, "name": "Mubassrin", "status": "Absent"},
    {"id": 23, "name": "Nikhil", "status": "Absent"},
    {"id": 24, "name": "Prabal Kumar", "status": "Absent"},
    {"id": 25, "name": "Priyanshu Rawat", "status": "Absent"},
    {"id": 26, "name": "Ricky Gariya", "status": "Absent"},
    {"id": 27, "name": "Suraj Sagar", "status": "Absent"},
    {"id": 28, "name": "Priyanshu Kumar", "status": "Absent"}
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
      await _firestore.collection("Agrithird").doc(todayDate).set({
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