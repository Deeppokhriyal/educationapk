import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Chemthird extends StatefulWidget {
  const Chemthird({super.key});

  @override
  _ChemthirdState createState() => _ChemthirdState();
}

class _ChemthirdState extends State<Chemthird> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students =
  [
    {"id": 1, "name": "Abhay Kumar", "status": "Absent"},
    {"id": 2, "name": "Abhay Pratap", "status": "Absent"},
    {"id": 3, "name": "Aman Kumar", "status": "Absent"},
    {"id": 4, "name": "Ankit", "status": "Absent"},
    {"id": 5, "name": "Atul Gussain", "status": "Absent"},
    {"id": 6, "name": "Bhupesh Manola", "status": "Absent"},
    {"id": 7, "name": "Dikshit Nainwal", "status": "Absent"},
    {"id": 8, "name": "Gaurav Joshi", "status": "Absent"},
    {"id": 9, "name": "Harshvardhan Joshi", "status": "Absent"},
    {"id": 10, "name": "Jaydeep", "status": "Absent"},
    {"id": 11, "name": "Kanishka", "status": "Absent"},
    {"id": 12, "name": "Kavita Rawat", "status": "Absent"},
    {"id": 13, "name": "Khushi", "status": "Absent"},
    {"id": 14, "name": "Lakshya Saxena", "status": "Absent"},
    {"id": 15, "name": "Manju Sagar", "status": "Absent"},
    {"id": 16, "name": "Mohd. Hashim", "status": "Absent"},
    {"id": 17, "name": "Mukul Dhiman", "status": "Absent"},
    {"id": 18, "name": "Nitin Rajwar", "status": "Absent"},
    {"id": 19, "name": "Pradeep Saini", "status": "Absent"},
    {"id": 20, "name": "Pragati", "status": "Absent"},
    {"id": 21, "name": "Prashant S. Negi", "status": "Absent"},
    {"id": 22, "name": "Rahul C. Tiwari", "status": "Absent"},
    {"id": 23, "name": "Rahul Kumar", "status": "Absent"},
    {"id": 24, "name": "Rajan K. Prajapati", "status": "Absent"},
    {"id": 25, "name": "Ravish Giri", "status": "Absent"},
    {"id": 26, "name": "Rohit Kumar", "status": "Absent"},
    {"id": 27, "name": "Sachin Arya", "status": "Absent"},
    {"id": 28, "name": "Sanchit Yadav", "status": "Absent"},
    {"id": 29, "name": "Simaun Bodi", "status": "Absent"},
    {"id": 30, "name": "Shivam Saini", "status": "Absent"},
    {"id": 31, "name": "Shivang Singh", "status": "Absent"},
    {"id": 32, "name": "Sneha Dhyani", "status": "Absent"},
    {"id": 33, "name": "Suraj Negi", "status": "Absent"},
    {"id": 34, "name": "Vishal Saini", "status": "Absent"},
    {"id": 35, "name": "Vivek", "status": "Absent"},
    {"id": 36, "name": "Vivek Anand", "status": "Absent"},
    {"id": 37, "name": "Yogesh Singh Bohra", "status": "Absent"},
    {"id": 38, "name": "Arjun Chilwal", "status": "Absent"},
    {"id": 39, "name": "Hem Chandra", "status": "Absent"},
    {"id": 40, "name": "Rohit Roshan", "status": "Absent"},
    {"id": 41, "name": "Saurav Joshi", "status": "Absent"},
    {"id": 42, "name": "Nikhil Kumar", "status": "Absent"},
    {"id": 43, "name": "Amul Kashyap", "status": "Absent"},
    {"id": 44, "name": "Kanav", "status": "Absent"},
    {"id": 45, "name": "Yash Rawat", "status": "Absent"}
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
      await _firestore.collection("Chemthird").doc(todayDate).set({
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