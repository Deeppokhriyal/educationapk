import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Chemsecond extends StatefulWidget {
  const Chemsecond({super.key});

  @override
  _ChemsecondState createState() => _ChemsecondState();
}

class _ChemsecondState extends State<Chemsecond> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students =[
    { "id": 1, "name": "Neha Parihar", "status": "Absent" },
    { "id": 2, "name": "Nirmala Upreti", "status": "Absent" },
    { "id": 3, "name": "Nitin Karki", "status": "Absent" },
    { "id": 4, "name": "Vivek Singh", "status": "Absent" },
    { "id": 5, "name": "Pushpendra P. Singh", "status": "Absent" },
    { "id": 6, "name": "Mohit Kumar", "status": "Absent" },
    { "id": 7, "name": "Bhaskar Sati", "status": "Absent" },
    { "id": 8, "name": "Arin Kumar", "status": "Absent" },
    { "id": 9, "name": "Anurag Yadav", "status": "Absent" },
    { "id": 10, "name": "Khushnuma", "status": "Absent" },
    { "id": 11, "name": "Pawandeep Kaur", "status": "Absent" },
    { "id": 12, "name": "Palak Sharma 🪬", "status": "Absent" },
    { "id": 13, "name": "Harshdev Gupta", "status": "Absent" },
    { "id": 14, "name": "Amit Singh", "status": "Absent" },
    { "id": 15, "name": "Yogesh Rawat", "status": "Absent" },
    { "id": 16, "name": "Shivam Pal", "status": "Absent" },
    { "id": 17, "name": "Amit Kumar", "status": "Absent" },
    { "id": 18, "name": "Priya", "status": "Absent" },
    { "id": 19, "name": "Vineta Mandal", "status": "Absent" },
    { "id": 20, "name": "Gaurav Bawari", "status": "Absent" },
    { "id": 21, "name": "Garvit Ruhela", "status": "Absent" },
    { "id": 22, "name": "Arvind Joshi", "status": "Absent" },
    { "id": 23, "name": "Sakshi Bisht", "status": "Absent" },
    { "id": 24, "name": "Prashant Kumar", "status": "Absent" },
    { "id": 25, "name": "Mohd. Anas", "status": "Absent" },
    { "id": 26, "name": "Narendra Kathaith", "status": "Absent" },
    { "id": 27, "name": "Anoop Mishra", "status": "Absent" },
    { "id": 28, "name": "Divyansh Bakshi", "status": "Absent" },
    { "id": 29, "name": "Jyoti Joshi", "status": "Absent" },
    { "id": 30, "name": "Ankit Kumar", "status": "Absent" },
    { "id": 31, "name": "Priyanshu Joshi", "status": "Absent" },
    { "id": 32, "name": "Sumit Kumar", "status": "Absent" },
    { "id": 33, "name": "Yamal Yadav", "status": "Absent" },
    { "id": 34, "name": "Deeksha Chaudhary", "status": "Absent" },
    { "id": 35, "name": "Deepa", "status": "Absent" },
    { "id": 36, "name": "Lucky Kumar", "status": "Absent" },
    { "id": 37, "name": "Deepak Giri", "status": "Absent" },
    { "id": 38, "name": "Yogesh Chandra Dourba", "status": "Absent" },
    { "id": 39, "name": "Amit Bhatt", "status": "Absent" },
    { "id": 40, "name": "Saurabh Rawat", "status": "Absent" },
    { "id": 41, "name": "Aditya Mishra", "status": "Absent" },
    { "id": 42, "name": "Deepak Kalakoti", "status": "Absent" },
    { "id": 43, "name": "Mayank", "status": "Absent" },
    { "id": 44, "name": "Shalu", "status": "Absent" },
    { "id": 45, "name": "Udit Tiwari", "status": "Absent" }
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
      await _firestore.collection("Chemsecond").doc(todayDate).set({
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