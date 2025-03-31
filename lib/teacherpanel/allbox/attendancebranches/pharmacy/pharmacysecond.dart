import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class Pharmacysecond extends StatefulWidget {
  const Pharmacysecond({super.key});

  @override
  _PharmacysecondState createState() => _PharmacysecondState();
}

class _PharmacysecondState extends State<Pharmacysecond> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students =[
    {"id": 1, "name": "Akanksha", "status": "Absent"},
    {"id": 2, "name": "Amit Rastogi", "status": "Absent"},
    {"id": 3, "name": "Asha", "status": "Absent"},
    {"id": 4, "name": "Babita", "status": "Absent"},
    {"id": 5, "name": "Babita", "status": "Absent"},
    {"id": 6, "name": "Been Kumar", "status": "Absent"},
    {"id": 7, "name": "Bhawana Rana", "status": "Absent"},
    {"id": 8, "name": "Bhumika Joshi", "status": "Absent"},
    {"id": 9, "name": "Dharmendra Palariya", "status": "Absent"},
    {"id": 10, "name": "Harshit Kumar Joshi", "status": "Absent"},
    {"id": 11, "name": "Himanshi", "status": "Absent"},
    {"id": 12, "name": "Himanshu Khati", "status": "Absent"},
    {"id": 13, "name": "Iqra", "status": "Absent"},
    {"id": 14, "name": "Iram", "status": "Absent"},
    {"id": 15, "name": "Jaiveer Singh", "status": "Absent"},
    {"id": 16, "name": "Kanishka", "status": "Absent"},
    {"id": 17, "name": "Km Pooja", "status": "Absent"},
    {"id": 18, "name": "Km Rekha", "status": "Absent"},
    {"id": 19, "name": "Manoj Pathak", "status": "Absent"},
    {"id": 20, "name": "Mansi Prajapati", "status": "Absent"},
    {"id": 21, "name": "Minakshi Negi", "status": "Absent"},
    {"id": 22, "name": "Mohd Aamir", "status": "Absent"},
    {"id": 23, "name": "Mohd Khalid", "status": "Absent"},
    {"id": 24, "name": "Munesh", "status": "Absent"},
    {"id": 25, "name": "Pramod Kumar", "status": "Absent"},
    {"id": 26, "name": "Prateeksha", "status": "Absent"},
    {"id": 27, "name": "Priya", "status": "Absent"},
    {"id": 28, "name": "Rashmi Rana", "status": "Absent"},
    {"id": 29, "name": "Samreen", "status": "Absent"},
    {"id": 30, "name": "Sejal Rana", "status": "Absent"},
    {"id": 31, "name": "Shahreen", "status": "Absent"},
    {"id": 32, "name": "Simran", "status": "Absent"},
    {"id": 33, "name": "Pramod Kumar Shukla", "status": "Absent"},
    {"id": 34, "name": "Nirmal Singh", "status": "Absent"},
    {"id": 35, "name": "Arpit Shah", "status": "Absent"},
    {"id": 36, "name": "Krish", "status": "Absent"}
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
      await _firestore.collection("Pharmacysecond").doc(todayDate).set({
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