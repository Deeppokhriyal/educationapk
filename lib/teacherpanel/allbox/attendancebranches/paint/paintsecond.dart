import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Paintsecond extends StatefulWidget {
  const Paintsecond({super.key});

  @override
  _PaintsecondState createState() => _PaintsecondState();
}

class _PaintsecondState extends State<Paintsecond> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    { "id": 1, "name": "Bhupendra Kumar", "status": "Absent" },
    { "id": 2, "name": "Ravi Kumar", "status": "Absent" },
    { "id": 3, "name": "Shivam Singh", "status": "Absent" },
    { "id": 4, "name": "Dheeraj Singh", "status": "Absent" },
    { "id": 5, "name": "Saniya Parveen", "status": "Absent" },
    { "id": 6, "name": "Mukul Bisht", "status": "Absent" },
    { "id": 7, "name": "Rahul Rawat", "status": "Absent" },
    { "id": 8, "name": "Lalit Kumar", "status": "Absent" },
    { "id": 9, "name": "Ashish", "status": "Absent" },
    { "id": 10, "name": "Vansh", "status": "Absent" },
    { "id": 11, "name": "Tara Singh Kaptoti", "status": "Absent" },
    { "id": 12, "name": "Abhay Singh", "status": "Absent" },
    { "id": 13, "name": "Harshita Sharma", "status": "Absent" },
    { "id": 14, "name": "Avinash Singh", "status": "Absent" },
    { "id": 15, "name": "Prabhgeet Kaur", "status": "Absent" },
    { "id": 16, "name": "Asim Ansari", "status": "Absent" },
    { "id": 17, "name": "Pradeep Singh", "status": "Absent" },
    { "id": 18, "name": "Aarish Ansari", "status": "Absent" },
    { "id": 19, "name": "Yash Kandpal", "status": "Absent" },
    { "id": 20, "name": "Sandeep Kaur", "status": "Absent" },
    { "id": 21, "name": "Nitin Negi", "status": "Absent" },
    { "id": 22, "name": "Aman", "status": "Absent" },
    { "id": 23, "name": "Harsh Bisht", "status": "Absent" },
    { "id": 24, "name": "Tanisha Rawat", "status": "Absent" },
    { "id": 25, "name": "Aditya Chandra", "status": "Absent" },
    { "id": 26, "name": "Jatin Kumar", "status": "Absent" },
    { "id": 27, "name": "Pragati Saxena", "status": "Absent" },
    { "id": 28, "name": "Deepak Sharma", "status": "Absent" },
    { "id": 29, "name": "Bharat Pandey", "status": "Absent" },
    { "id": 30, "name": "Aman Kohli", "status": "Absent" },
    { "id": 31, "name": "Araba Ali", "status": "Absent" },
    { "id": 32, "name": "Akash Kumar", "status": "Absent" },
    { "id": 33, "name": "Nitin Kumar", "status": "Absent" },
    { "id": 34, "name": "Shivam Chandra", "status": "Absent" },
    { "id": 35, "name": "Vivek", "status": "Absent" }
  ]
  ;

  // Function to update attendance in Firestore
  Future<void> markAttendance() async {
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    List<Map<String, dynamic>> attendanceList = students.map((student) {
      return {
        "id": student['id'],
        "name": student['name'],
        "status": student['status']
      };
    }).toList();

    await _firestore.collection("Paintsecond").doc(todayDate).set({
      "attendance": attendanceList,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Attendance saved successfully!")),
    );
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
          ElevatedButton(
            onPressed: markAttendance,
            child: Text("Submit Attendance",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 19,color: Colors.blue),),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}