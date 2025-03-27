import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Civilfirst extends StatefulWidget {
  const Civilfirst({super.key});

  @override
  _CivilfirstState createState() => _CivilfirstState();
}

class _CivilfirstState extends State<Civilfirst> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    { "id": 1, "name": "Animesh Kohli", "status": "Absent" },
    { "id": 2, "name": "Ankita", "status": "Absent" },
    { "id": 3, "name": "Anuj Kumar", "status": "Absent" },
    { "id": 4, "name": "Anurag Mishra", "status": "Absent" },
    { "id": 5, "name": "Aryan Chandola", "status": "Absent" },
    { "id": 6, "name": "Ashutosh Joshi", "status": "Absent" },
    { "id": 7, "name": "Ayush Singh", "status": "Absent" },
    { "id": 8, "name": "Chhavi Chauhan", "status": "Absent" },
    { "id": 9, "name": "Deepika Rawat", "status": "Absent" },
    { "id": 10, "name": "Dolly", "status": "Absent" },
    { "id": 11, "name": "Gaurav Rawat", "status": "Absent" },
    { "id": 12, "name": "Gautam Pant", "status": "Absent" },
    { "id": 13, "name": "Gyan Singh", "status": "Absent" },
    { "id": 14, "name": "Hardik Bisht", "status": "Absent" },
    { "id": 15, "name": "Jatin Singh", "status": "Absent" },
    { "id": 16, "name": "Krish", "status": "Absent" },
    { "id": 17, "name": "Mayank Kohli", "status": "Absent" },
    { "id": 18, "name": "Meenakshi Rawat", "status": "Absent" },
    { "id": 19, "name": "Mohd Zaid", "status": "Absent" },
    { "id": 20, "name": "Neeraj Patwal", "status": "Absent" },
    { "id": 21, "name": "Nisha Rawat", "status": "Absent" },
    { "id": 22, "name": "Prawesh Kumar", "status": "Absent" },
    { "id": 23, "name": "Priya Rana", "status": "Absent" },
    { "id": 24, "name": "Priyanshi Kabdal", "status": "Absent" },
    { "id": 25, "name": "Ritika", "status": "Absent" },
    { "id": 26, "name": "Sanjay Kumar", "status": "Absent" },
    { "id": 27, "name": "Saurav Pant", "status": "Absent" },
    { "id": 28, "name": "Shakib Hussain", "status": "Absent" },
    { "id": 29, "name": "Shristi Negi", "status": "Absent" },
    { "id": 30, "name": "Shivam Kumar", "status": "Absent" },
    { "id": 31, "name": "Shivam Rautela", "status": "Absent" },
    { "id": 32, "name": "Saurabh", "status": "Absent" },
    { "id": 33, "name": "Sudhanshu Kumar", "status": "Absent" },
    { "id": 34, "name": "Suman", "status": "Absent" },
    { "id": 35, "name": "Sumit Joshi", "status": "Absent" },
    { "id": 36, "name": "Vaishnavi Verma", "status": "Absent" },
    { "id": 37, "name": "Vansh Kumar", "status": "Absent" },
    { "id": 38, "name": "Varun Singh", "status": "Absent" },
    { "id": 39, "name": "Vatsal Joshi", "status": "Absent" },
    { "id": 40, "name": "Vidhi Vishnoi", "status": "Absent" },
    { "id": 41, "name": "Yash Pal", "status": "Absent" }
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