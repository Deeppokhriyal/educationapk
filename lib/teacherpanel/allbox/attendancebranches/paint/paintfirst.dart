import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Paintfirst extends StatefulWidget {
  const Paintfirst({super.key});

  @override
  _PaintfirstState createState() => _PaintfirstState();
}

class _PaintfirstState extends State<Paintfirst> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Rajkumar", 'status': 'Absent'},
    {"id": 2, "name": "Gunjan Pant", 'status': 'Absent'},
    {"id": 3, "name": "Deepanshu Kumar", 'status': 'Absent'},
    {"id": 4, "name": "Bhavesh Bisht", 'status': 'Absent'},
    {"id": 5, "name": "Akansha Sharma", 'status': 'Absent'},
    {"id": 6, "name": "Nitin Singh", 'status': 'Absent'},
    {"id": 7, "name": "Rahul Manral", 'status': 'Absent'},
    {"id": 8, "name": "Mahesh Rathor", 'status': 'Absent'},
    {"id": 9, "name": "Harsh Verma", 'status': 'Absent'},
    {"id": 10, "name": "Sidra Afifa", 'status': 'Absent'},
    {"id": 11, "name": "Manish Paliwal", 'status': 'Absent'},
    {"id": 12, "name": "Rohit Singh Bisht", 'status': 'Absent'},
    {"id": 13, "name": "Sahil Chand", 'status': 'Absent'},
    {"id": 14, "name": "Pushpanjali Rawat", 'status': 'Absent'},
    {"id": 15, "name": "Om Pandey", 'status': 'Absent'},
    {"id": 16, "name": "Krish", 'status': 'Absent'},
    {"id": 17, "name": "Raja Rautela", 'status': 'Absent'},
    {"id": 18, "name": "Harsh Kumar", 'status': 'Absent'},
    {"id": 19, "name": "Gaurav Bisht", 'status': 'Absent'},
    {"id": 20, "name": "Shivani Singh", 'status': 'Absent'},
    {"id": 21, "name": "Neeraj Singh Bisht", 'status': 'Absent'},
    {"id": 22, "name": "Sumit Kumar", 'status': 'Absent'},
    {"id": 23, "name": "Ashish Sharma", 'status': 'Absent'},
    {"id": 24, "name": "KM Pooja Prajapati", 'status': 'Absent'},
    {"id": 25, "name": "Gaurav Thuwal", 'status': 'Absent'},
    {"id": 26, "name": "Sachin Kumar", 'status': 'Absent'},
    {"id": 27, "name": "Mahi", 'status': 'Absent'},
    {"id": 28, "name": "Kumkum", 'status': 'Absent'},
    {"id": 29, "name": "Ritik Mahtoliya", 'status': 'Absent'},
    {"id": 30, "name": "Khushboo", 'status': 'Absent'},
    {"id": 31, "name": "Rahul Arya", 'status': 'Absent'},
    {"id": 32, "name": "Arti Balodi", 'status': 'Absent'},
    {"id": 33, "name": "Lalit Singh Kanyal", 'status': 'Absent'},
    {"id": 34, "name": "Ajay Petshali", 'status': 'Absent'},
    {"id": 35, "name": "Ajay", 'status': 'Absent'},
    {"id": 36, "name": "Anshika Gulati", 'status': 'Absent'},
    {"id": 37, "name": "Diya Diwakar", 'status': 'Absent'},
    {"id": 38, "name": "Sanskriti Mishra", 'status': 'Absent'},
    {"id": 39, "name": "Saniya", 'status': 'Absent'},
    {"id": 40, "name": "Manas Rawat", 'status': 'Absent'},
    {"id": 41, "name": "Ratandeep", 'status': 'Absent'},
    {"id": 42, "name": "Vaseem", 'status': 'Absent'},
    {"id": 43, "name": "Tanuja", 'status': 'Absent'},
    {"id": 44, "name": "Sumit Bhandari", 'status': 'Absent'},
    {"id": 45, "name": "Deepak Singh", 'status': 'Absent'},
  ];

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

    await _firestore.collection("Paintfirst").doc(todayDate).set({
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