import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Elecsecond extends StatefulWidget {
  const Elecsecond({super.key});

  @override
  _ElecsecondState createState() => _ElecsecondState();
}

class _ElecsecondState extends State<Elecsecond> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students =[
    {"id": 1, "name": "Gaurav Nailwal", "status": "Absent"},
    {"id": 2, "name": "Gauri Saxena", "status": "Absent"},
    {"id": 3, "name": "Firaj", "status": "Absent"},
    {"id": 4, "name": "Sachin Aeri", "status": "Absent"},
    {"id": 5, "name": "Bhaghirath Naag", "status": "Absent"},
    {"id": 6, "name": "Akhilesh Kushwaha", "status": "Absent"},
    {"id": 7, "name": "Pankaj Singh", "status": "Absent"},
    {"id": 8, "name": "Sakshi Yadav", "status": "Absent"},
    {"id": 9, "name": "Sneha", "status": "Absent"},
    {"id": 10, "name": "Deepak Sahu", "status": "Absent"},
    {"id": 11, "name": "Aakiriti Gaur", "status": "Absent"},
    {"id": 12, "name": "Suryansh", "status": "Absent"},
    {"id": 13, "name": "Suhani Bhardwaj", "status": "Absent"},
    {"id": 14, "name": "Manas Negi", "status": "Absent"},
    {"id": 15, "name": "Yogesh Chandra Suyal", "status": "Absent"},
    {"id": 16, "name": "Pankaj", "status": "Absent"},
    {"id": 17, "name": "Krishna", "status": "Absent"},
    {"id": 18, "name": "Ravi Kumar", "status": "Absent"},
    {"id": 19, "name": "Karan Kumar", "status": "Absent"},
    {"id": 20, "name": "Priyanshu Rawat", "status": "Absent"},
    {"id": 21, "name": "Aditya", "status": "Absent"},
    {"id": 22, "name": "Km. Pallavi Sati", "status": "Absent"},
    {"id": 23, "name": "Parul", "status": "Absent"},
    {"id": 24, "name": "Priya", "status": "Absent"},
    {"id": 25, "name": "Km. Kajal", "status": "Absent"},
    {"id": 26, "name": "Km. Monika Negi", "status": "Absent"},
    {"id": 27, "name": "Mohit Dutt", "status": "Absent"},
    {"id": 28, "name": "Sanjay Singh Bohra", "status": "Absent"},
    {"id": 29, "name": "Shiv Saxena", "status": "Absent"},
    {"id": 30, "name": "Tejashvi", "status": "Absent"},
    {"id": 31, "name": "Udit Kumar Kashyap", "status": "Absent"},
    {"id": 32, "name": "Yogesh Rawat", "status": "Absent"},
    {"id": 33, "name": "Mandeep Singh", "status": "Absent"},
    {"id": 34, "name": "Ansh Saxena", "status": "Absent"},
    {"id": 35, "name": "Sachin Joshi", "status": "Absent"},
    {"id": 36, "name": "Kamal Singh", "status": "Absent"},
    {"id": 37, "name": "Sandeep Kumar", "status": "Absent"},
    {"id": 38, "name": "Khushi Chauhan", "status": "Absent"},
    {"id": 39, "name": "Vandana", "status": "Absent"},
    {"id": 40, "name": "Jagdish Singh", "status": "Absent"},
    {"id": 41, "name": "Ashish Kumar", "status": "Absent"},
    {"id": 42, "name": "Amit Kumar", "status": "Absent"},
    {"id": 43, "name": "Raghuveer Singh", "status": "Absent"},
    {"id": 44, "name": "Manish Rautela", "status": "Absent"},
    {"id": 45, "name": "Hem Chandra", "status": "Absent"},
    {"id": 46, "name": "Mohit Dhyani", "status": "Absent"},
    {"id": 47, "name": "Amit Shah", "status": "Absent"}
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
      await _firestore.collection("Elecsecond").doc(todayDate).set({
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