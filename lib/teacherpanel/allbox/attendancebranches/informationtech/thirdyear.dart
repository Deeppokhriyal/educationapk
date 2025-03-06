import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Thirdyear extends StatefulWidget {
  @override
  _ThirdyearState createState() => _ThirdyearState();
}

class _ThirdyearState extends State<Thirdyear> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false; // ✅ Loading flag added

  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Aditya Verma", 'status': 'Absent'},
    {"id": 2, "name": "Ankita Mandal", 'status': 'Absent'},
    {"id": 3, "name": "Ashish Rawat", 'status': 'Absent'},
    {"id": 4, "name": "Ayush Kohli", 'status': 'Absent'},
    {"id": 5, "name": "Bharat Singh Rawat", 'status': 'Absent'},
    {"id": 6, "name": "Deepak Pokhriyal", 'status': 'Absent'},
    {"id": 7, "name": "Deepak Rawat", 'status': 'Absent'},
    {"id": 8, "name": "Farheen Saifi", 'status': 'Absent'},
    {"id": 9, "name": "Gaytri Kaushik", 'status': 'Absent'},
    {"id": 10, "name": "Ghanshyam Pargai", 'status': 'Absent'},
  ];

  // ✅ Function to update attendance in Firestore with loading indicator
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white), // ✅ Success Icon
              SizedBox(width: 10),
              Text("Attendance submitted successfully!", style: TextStyle(fontSize: 18)),
            ],
          ),
          backgroundColor: Colors.green, // ✅ Green color
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(16),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // ❌ Red SnackBar for Errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.white), // ❌ Error Icon
              SizedBox(width: 10),
              Text("Error saving attendance!", style: TextStyle(fontSize: 18)),
            ],
          ),
          backgroundColor: Colors.red, // ❌ Red color
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(16),
          duration: Duration(seconds: 2),
        ),
      );
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("Today's Date: $today", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20)),
      ),
      body: Column(
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
                      Text(
                        "${students[index]['id'].toString()}. ${students[index]['name']}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'nexaheavy',
                          color: students[index]['status'] == 'Present'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      DropdownButton<String>(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'nexalight'
                        ),
                        borderRadius: BorderRadius.circular(35),
                        hint: Text(
                          'Select',
                          style: TextStyle(
                              fontFamily: 'nexalight',
                              color: Colors.black,
                              fontSize: 18
                          ),
                        ),
                        value: students[index]['status'],
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

          // ✅ Show loading indicator when submitting
          isLoading
              ? CircularProgressIndicator() // Loader
              : ElevatedButton(
            onPressed: isLoading ? null : markAttendance, // Disable button if loading
            child: Text(
              "Submit Attendance",
              style: TextStyle(fontFamily: 'nexaheavy', fontSize: 19, color: Colors.blue),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
