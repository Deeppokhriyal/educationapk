import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Elecfirst extends StatefulWidget {
  const Elecfirst({super.key});

  @override
  _ElecfirstState createState() => _ElecfirstState();
}

class _ElecfirstState extends State<Elecfirst> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Abhay Kumar", "status": "Absent"},
    {"id": 2, "name": "Abhay Singh", "status": "Absent"},
    {"id": 3, "name": "Abhishek Kumar", "status": "Absent"},
    {"id": 4, "name": "Aman Verma", "status": "Absent"},
    {"id": 5, "name": "Amit Chandra Arya", "status": "Absent"},
    {"id": 6, "name": "Anshika Patwal", "status": "Absent"},
    {"id": 7, "name": "Arstan", "status": "Absent"},
    {"id": 8, "name": "Ashwani Kumar", "status": "Absent"},
    {"id": 9, "name": "Gajraj Singh", "status": "Absent"},
    {"id": 10, "name": "Gaurav Chauhan", "status": "Absent"},
    {"id": 11, "name": "Khushi", "status": "Absent"},
    {"id": 12, "name": "Khushi Shah", "status": "Absent"},
    {"id": 13, "name": "Khushi Shrivastava", "status": "Absent"},
    {"id": 14, "name": "Krishna Verma", "status": "Absent"},
    {"id": 15, "name": "Kumud Kumar", "status": "Absent"},
    {"id": 16, "name": "Lokesh Bisht", "status": "Absent"},
    {"id": 17, "name": "Manjeet Pal", "status": "Absent"},
    {"id": 18, "name": "Milky Gautam", "status": "Absent"},
    {"id": 19, "name": "Mohd Aasif Saifi", "status": "Absent"},
    {"id": 20, "name": "Mohd Ayan", "status": "Absent"},
    {"id": 21, "name": "Neeraj Kumar", "status": "Absent"},
    {"id": 22, "name": "Nitin Kumar", "status": "Absent"},
    {"id": 23, "name": "Nitin Kumar", "status": "Absent"},
    {"id": 24, "name": "Pankaj Pandey", "status": "Absent"},
    {"id": 25, "name": "Parveen Kumar", "status": "Absent"},
    {"id": 26, "name": "Priyanshu", "status": "Absent"},
    {"id": 27, "name": "Priyanshu Upadhyay", "status": "Absent"},
    {"id": 28, "name": "Rahila Anjum", "status": "Absent"},
    {"id": 29, "name": "Raja Abhishek", "status": "Absent"},
    {"id": 30, "name": "Rakesh Singh", "status": "Absent"},
    {"id": 31, "name": "Rukmani", "status": "Absent"},
    {"id": 32, "name": "Sanjay Nishad", "status": "Absent"},
    {"id": 33, "name": "Shagun Sheetal", "status": "Absent"},
    {"id": 34, "name": "Shubh Negi", "status": "Absent"},
    {"id": 35, "name": "Soumil Parmar", "status": "Absent"},
    {"id": 36, "name": "Suraj Kumar", "status": "Absent"},
    {"id": 37, "name": "Tanisha", "status": "Absent"},
    {"id": 38, "name": "Tanu Chauhan", "status": "Absent"},
    {"id": 39, "name": "Varun Verma", "status": "Absent"},
    {"id": 40, "name": "Yogesh Singh", "status": "Absent"},
    {"id": 41, "name": "Zeeshan", "status": "Absent"}
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