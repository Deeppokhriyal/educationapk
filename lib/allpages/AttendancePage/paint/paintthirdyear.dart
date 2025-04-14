import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Paintthirdyear extends StatefulWidget {
  @override
  _PaintthirdyearState createState() => _PaintthirdyearState();
}

class _PaintthirdyearState extends State<Paintthirdyear> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedDate;
  List<Map<String, dynamic>> attendanceRecords = [];

  // Function to open date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        selectedDate = formattedDate;
      });
      fetchAttendanceByDate(formattedDate);
    }
  }

  // Function to fetch attendance for selected date
  Future<void> fetchAttendanceByDate(String date) async {
    DocumentSnapshot snapshot =
    await _firestore.collection("Paintthird").doc(date).get();

    if (snapshot.exists) {
      List<dynamic> attendanceList = snapshot["attendance"];
      setState(() {
        attendanceRecords = attendanceList.cast<Map<String, dynamic>>();
      });
    } else {
      setState(() {
        attendanceRecords = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance 3rd year",style: TextStyle(fontFamily: 'nexaheavy'),),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(selectedDate == null
                  ? "Select Date"
                  : "Date: $selectedDate",style: TextStyle(fontFamily: 'nexalight',fontSize: 23,color: Colors.black),),
            ),
          ),
          Expanded(
            child: attendanceRecords.isEmpty
                ? Center(child: Text("No records found",style: TextStyle(fontSize: 25,fontFamily: 'nexaheavy'),))
                : ListView.builder(
              itemCount: attendanceRecords.length,
              itemBuilder: (context, index) {
                var student = attendanceRecords[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: ListTile(
                    title: Text("${student['id']}. ${student['name']}",style: TextStyle(fontFamily: 'nexalight'),),
                    trailing: Text(
                      student['status'],
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'nexaheavy',
                        color: student['status'] == "Present"
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
