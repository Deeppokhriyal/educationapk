
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Mechsecond extends StatefulWidget {
  const Mechsecond({super.key});

  @override
  _MechsecondState createState() => _MechsecondState();
}

class _MechsecondState extends State<Mechsecond> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Ashok Kumar", "status": "Absent"},
    {"id": 2, "name": "Aditya Rawat", "status": "Absent"},
    {"id": 3, "name": "KM. Roshni", "status": "Absent"},
    {"id": 4, "name": "Bhoomika Bisht", "status": "Absent"},
    {"id": 5, "name": "Priya Mandal", "status": "Absent"},
    {"id": 6, "name": "Harsh Kumar", "status": "Absent"},
    {"id": 7, "name": "Purushottam", "status": "Absent"},
    {"id": 8, "name": "Vinay Kumar", "status": "Absent"},
    {"id": 9, "name": "Sarvesh Kumar", "status": "Absent"},
    {"id": 10, "name": "Saurabh Dubey", "status": "Absent"},
    {"id": 11, "name": "Yuvraj", "status": "Absent"},
    {"id": 12, "name": "Yogesh Joshi", "status": "Absent"},
    {"id": 13, "name": "Rinku Sharma", "status": "Absent"},
    {"id": 14, "name": "Yogesh Arya", "status": "Absent"},
    {"id": 15, "name": "Jatin Mehta", "status": "Absent"},
    {"id": 16, "name": "Shivam Gangwar", "status": "Absent"},
    {"id": 17, "name": "Vivek Latwal", "status": "Absent"},
    {"id": 18, "name": "Manvendra Singh", "status": "Absent"},
    {"id": 19, "name": "Manish Chandra Joshi", "status": "Absent"},
    {"id": 20, "name": "Rishabh Arya", "status": "Absent"},
    {"id": 21, "name": "Riya Bhardwaj", "status": "Absent"},
    {"id": 22, "name": "Jatin Pant", "status": "Absent"},
    {"id": 23, "name": "Bhavya Sharma", "status": "Absent"},
    {"id": 24, "name": "Ranjana Chaudhary", "status": "Absent"},
    {"id": 25, "name": "Nitin Singh", "status": "Absent"},
    {"id": 26, "name": "Ashana Rana", "status": "Absent"},
    {"id": 27, "name": "Sheetai", "status": "Absent"},
    {"id": 28, "name": "Nikhil", "status": "Absent"},
    {"id": 29, "name": "Vikas Kumar", "status": "Absent"},
    {"id": 30, "name": "Rohit Singh", "status": "Absent"},
    {"id": 31, "name": "Shantanu Singh Negi", "status": "Absent"},
    {"id": 32, "name": "Gautam Tewari", "status": "Absent"},
    {"id": 33, "name": "Gulshan", "status": "Absent"},
    {"id": 34, "name": "Garima Chauhan", "status": "Absent"},
    {"id": 35, "name": "Shivam Bisht", "status": "Absent"},
    {"id": 36, "name": "Vishakha Tomar", "status": "Absent"},
    {"id": 37, "name": "Kamlesh Kumar", "status": "Absent"},
    {"id": 38, "name": "Abhishek Singh", "status": "Absent"},
    {"id": 39, "name": "Mohd. Faizan", "status": "Absent"},
    {"id": 40, "name": "Nitin Prajapati", "status": "Absent"},
    {"id": 41, "name": "Kailash Chandra", "status": "Absent"},
    {"id": 42, "name": "Abhishek", "status": "Absent"},
    {"id": 43, "name": "Banti Beldar", "status": "Absent"},
    {"id": 44, "name": "Himanshu Pandey", "status": "Absent"},
    {"id": 45, "name": "Rahul Kashyap", "status": "Absent"},
    {"id": 46, "name": "Shashank Pal", "status": "Absent"},
    {"id": 47, "name": "Umang Joshi", "status": "Absent"},
    {"id": 48, "name": "Vaibhav Kumar Upadhaya", "status": "Absent"},
    {"id": 49, "name": "Yogesh Pandey", "status": "Absent"}
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
      await _firestore.collection("MechSecond").doc(todayDate).set({
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