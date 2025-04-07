import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Electhird extends StatefulWidget {
  const Electhird({super.key});

  @override
  _ElecthirdState createState() => _ElecthirdState();
}

class _ElecthirdState extends State<Electhird> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Megha Bisht", "status": "Absent"},
    {"id": 2, "name": "Priya Pal", "status": "Absent"},
    {"id": 3, "name": "Amit Kumar", "status": "Absent"},
    {"id": 4, "name": "Abhay", "status": "Absent"},
    {"id": 5, "name": "Abhishek", "status": "Absent"},
    {"id": 6, "name": "Akshay Chauhan", "status": "Absent"},
    {"id": 7, "name": "Aman Kumar", "status": "Absent"},
    {"id": 8, "name": "Aneesh Rawat", "status": "Absent"},
    {"id": 9, "name": "Ankit Mehra", "status": "Absent"},
    {"id": 10, "name": "Ashish Biisht", "status": "Absent"},
    {"id": 11, "name": "Deepak Kumar", "status": "Absent"},
    {"id": 12, "name": "Deepak S. Karki", "status": "Absent"},
    {"id": 13, "name": "Divya", "status": "Absent"},
    {"id": 14, "name": "Divya Koranga", "status": "Absent"},
    {"id": 15, "name": "Divyanshi", "status": "Absent"},
    {"id": 16, "name": "Kamal C. Ruwali", "status": "Absent"},
    {"id": 17, "name": "Km. Nikita", "status": "Absent"},
    {"id": 18, "name": "Krishna S. Kapkoti", "status": "Absent"},
    {"id": 19, "name": "Mohd. Afzal", "status": "Absent"},
    {"id": 20, "name": "Mohd. Shadik", "status": "Absent"},
    {"id": 21, "name": "Omveer Singh", "status": "Absent"},
    {"id": 22, "name": "Pawan Singh", "status": "Absent"},
    {"id": 23, "name": "Prashant Chauhan", "status": "Absent"},
    {"id": 24, "name": "Priyanshu", "status": "Absent"},
    {"id": 25, "name": "Rahul Nailwal", "status": "Absent"},
    {"id": 26, "name": "Sahil Sharma", "status": "Absent"},
    {"id": 27, "name": "Saurabh S. Bisht", "status": "Absent"},
    {"id": 28, "name": "Shahran", "status": "Absent"},
    {"id": 29, "name": "Shivam", "status": "Absent"},
    {"id": 30, "name": "Shiya Maithani", "status": "Absent"},
    {"id": 31, "name": "Suraj Ray", "status": "Absent"},
    {"id": 32, "name": "Suraj S. Fartyal", "status": "Absent"},
    {"id": 33, "name": "Ujjawal Kumar", "status": "Absent"},
    {"id": 34, "name": "Vaibhav Maindolia", "status": "Absent"},
    {"id": 35, "name": "Pradeep Singh", "status": "Absent"},
    {"id": 36, "name": "Neha Rajput", "status": "Absent"},
    {"id": 37, "name": "Diksha", "status": "Absent"},
    {"id": 38, "name": "Saloni Pal", "status": "Absent"},
    {"id": 39, "name": "Palvindar Singh", "status": "Absent"},
    {"id": 40, "name": "Shinoy Roy", "status": "Absent"},
    {"id": 41, "name": "Dhruv Chauhan", "status": "Absent"},
    {"id": 42, "name": "Kuldeep Saini", "status": "Absent"}
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
      await _firestore.collection("Electhird").doc(todayDate).set({
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