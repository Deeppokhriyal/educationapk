import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Csthird extends StatefulWidget {
  const Csthird({super.key});

  @override
  _CsthirdState createState() => _CsthirdState();
}

class _CsthirdState extends State<Csthird> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Aarif", 'status': 'Absent'},
    {"id": 2, "name": "Abhishek Kirti", 'status': 'Absent'},
    {"id": 3, "name": "Abhishek", 'status': 'Absent'},
    {"id": 4, "name": "Amisha Rawat", 'status': 'Absent'},
    {"id": 5, "name": "Anchal", 'status': 'Absent'},
    {"id": 6, "name": "Arpit Rawat", 'status': 'Absent'},
    {"id": 7, "name": "Avantika", 'status': 'Absent'},
    {"id": 8, "name": "Bhumika", 'status': 'Absent'},
    {"id": 9, "name": "Dev Arya", 'status': 'Absent'},
    {"id": 10, "name": "Diya Manral", 'status': 'Absent'},
    {"id": 11, "name": "Gaurav Dangwal", 'status': 'Absent'},
    {"id": 12, "name": "Harish Giri", 'status': 'Absent'},
    {"id": 13, "name": "Ishan Papnoi", 'status': 'Absent'},
    {"id": 14, "name": "Jai Prakash Sharma", 'status': 'Absent'},
    {"id": 15, "name": "Jyoti Rana", 'status': 'Absent'},
    {"id": 16, "name": "Lalit Joshi", 'status': 'Absent'},
    {"id": 17, "name": "Lucky Singh Bora", 'status': 'Absent'},
    {"id": 18, "name": "Madhumita", 'status': 'Absent'},
    {"id": 19, "name": "Manish Singh Bisht", 'status': 'Absent'},
    {"id": 20, "name": "Mayank Negi", 'status': 'Absent'},
    {"id": 21, "name": "Mohd Ayan Ansari", 'status': 'Absent'},
    {"id": 22, "name": "Mukesh Chandra Arya", 'status': 'Absent'},
    {"id": 23, "name": "Prajjwal Prajapati", 'status': 'Absent'},
    {"id": 24, "name": "Priyanka", 'status': 'Absent'},
    {"id": 25, "name": "Rahul Upadhayaya", 'status': 'Absent'},
    {"id": 26, "name": "Riya Katiyar", 'status': 'Absent'},
    {"id": 27, "name": "Saziya", 'status': 'Absent'},
    {"id": 28, "name": "Sumit Nath Goswami", 'status': 'Absent'},
    {"id": 29, "name": "Sweta Sharma", 'status': 'Absent'},
    {"id": 30, "name": "Tarun Kumar", 'status': 'Absent'},
    {"id": 31, "name": "Tushar Kumar", 'status': 'Absent'},
    {"id": 32, "name": "Vishal Verma", 'status': 'Absent'},
    {"id": 33, "name": "Ankur Kumar", 'status': 'Absent'},
    {"id": 34, "name": "Sumit Kotiya", 'status': 'Absent'},
    {"id": 35, "name": "Rahul Singh Patwal", 'status': 'Absent'},
    {"id": 36, "name": "Neeraj Negi", 'status': 'Absent'},
    {"id": 37, "name": "Maya Rawat", 'status': 'Absent'},
    {"id": 38, "name": "Kamal Kandpal", 'status': 'Absent'},
    {"id": 39, "name": "Anurag Pandey", 'status': 'Absent'},
    {"id": 40, "name": "Mayank Devrani", 'status': 'Absent'},
    {"id": 41, "name": "Ritik Devrani", 'status': 'Absent'},
    {"id": 42, "name": "Harshita Adhikari", 'status': 'Absent'},
    {"id": 43, "name": "Omkar Gour", 'status': 'Absent'},
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
      await _firestore.collection("CS3rdyear").doc(todayDate).set({
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