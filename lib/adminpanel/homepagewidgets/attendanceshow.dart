import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class AdminAttendancePage extends StatefulWidget {
  @override
  _AdminAttendancePageState createState() => _AdminAttendancePageState();
}

class _AdminAttendancePageState extends State<AdminAttendancePage> {
  final Map<String, Map<String, String>> branchCollections = {
    'IT': {
      '1st Year': 'attendance1styear',
      '2nd Year': 'attendance2ndyear',
      '3rd Year': 'attendance3rdyear',
    },
    'CSE': {
      '1st Year': 'CS1styear',
      '2nd Year': 'CS2ndyear',
      '3rd Year': 'CS3rdyear',
    },
    'CHEMICAL': {
      '1st Year': 'Chemfirst',
      '2nd Year': 'Chemsecond',
      '3rd Year': 'Chemthird',
    },
    'CHEM. PAINT': {
      '1st Year': 'Paintfirst',
      '2nd Year': 'Paintsecond',
      '3rd Year': 'Paintthird',
    },
    'ELECTRONICS': {
      '1st Year': 'Elecfirst',
      '2nd Year': 'Elecsecond',
      '3rd Year': 'Electhird',
    },
    'PHARMACY': {
      '1st Year': 'Pharmacyfirst',
      '2nd Year': 'Pharmacysecond',
    },
    'MECHANICAL': {
      '1st Year': 'Mechfirst',
      '2nd Year': 'MechSecond',
      '3rd Year': 'MechThird',
    },
    'AGRICULTURE': {
      '1st Year': 'Agrifirst',
      '2nd Year': 'Agrisecond',
      '3rd Year': 'Agrithird',
    },
    'CIVIL': {
      '1st Year': 'Civilfirst',
      '2nd Year': 'Civilsecond',
      '3rd Year': 'Civilthird',
    },
  };

  String? selectedBranch;
  String? selectedYear;
  DateTime? selectedDate;
  int presentCount = 0;
  int absentCount = 0;
  int totalCount = 0;
  bool isLoading = false;
  String errorMessage = '';
  List<Map<String, dynamic>> studentList = [];

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        errorMessage = '';
      });
      await fetchAttendance();
    }
  }

  Future<void> fetchAttendance() async {
    if (selectedBranch == null || selectedYear == null || selectedDate == null) {
      setState(() {
        errorMessage = 'Please select branch, year and date';
      });
      return;
    }

    setState(() {
      isLoading = true;
      studentList = [];
      presentCount = 0;
      absentCount = 0;
      totalCount = 0;
      errorMessage = '';
    });

    String collectionPath = branchCollections[selectedBranch]![selectedYear]!;
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    print("Fetching from collection: $collectionPath, document: $formattedDate");

    try {
      // First check if the date document exists
      var dateDoc = await FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(formattedDate)
          .get();

      if (!dateDoc.exists) {
        setState(() {
          errorMessage = 'No attendance records found for selected date';
        });
        return;
      }

      List<dynamic> attendanceList = dateDoc.data()?['attendance'] ?? [];

      if (attendanceList.isEmpty) {
        setState(() {
          errorMessage = 'No student attendance found for selected date';
        });
        return;
      }

      List<Map<String, dynamic>> students = [];
      int present = 0;
      int absent = 0;

      for (var studentData in attendanceList) {
        final status = (studentData['status']?.toString().toLowerCase() ?? 'absent');
        students.add({
          'name': studentData['name'] ?? 'Unknown',
          'status': studentData['status']?.toString().toLowerCase() ?? 'absent',
          'rollNo': studentData['rollNo']?.toString() ?? '',
        });

        if (status == 'present') {
          present++;
        } else {
          absent++;
        }
      }

      setState(() {
        studentList = students;
        presentCount = present;
        absentCount = absent;
        totalCount = students.length;
      });

    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        errorMessage = 'Error fetching attendance data: ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Attendance Page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          // Branch and Year Selection
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                ...branchCollections.entries.map((branch) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 12),
                    child: ExpansionTile(
                      title: Text(
                        branch.key,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      children: branch.value.entries.map((yearEntry) {
                        return ListTile(
                          title: Text(yearEntry.key),
                          trailing: Icon(Icons.calendar_month),
                          onTap: () async {
                            setState(() {
                              selectedBranch = branch.key;
                              selectedYear = yearEntry.key;
                              errorMessage = '';
                            });
                            await _pickDate();
                          },
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),

          // Loading Indicator
          if (isLoading)
            Padding(
              padding: EdgeInsets.all(16),
              child: SpinKitFadingCircle(
    color: Colors.green,  // Change color as needed
    size: 30.0,          // Adjust size
    ),
            ),

          // Error Message
          if (errorMessage.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),

          // Attendance Summary
          if (selectedBranch != null && selectedYear != null && selectedDate != null && !isLoading)
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Branch: $selectedBranch", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Year: $selectedYear", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Date: ${DateFormat('dd MMM yyyy').format(selectedDate!)}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                  Text(
                    "Attendance Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Present: $presentCount", style: TextStyle(color: Colors.green, fontSize: 16)),
                      Text("Absent: $absentCount", style: TextStyle(color: Colors.red, fontSize: 16)),
                      Text("Total: $totalCount", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),
                  if (totalCount > 0)
                    Text(
                      "Percentage: ${(presentCount / totalCount * 100).toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
            ),

          // Student List
          if (studentList.isNotEmpty)
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Text(
                    "Student Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ...studentList.map((student) {
                    return Card(
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: Text(student['name']),
                        subtitle: Text("Roll No: ${student['rollNo']}"),
                        trailing: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: student['status'].toString().toLowerCase() == 'present'
                                ? Colors.green.withOpacity(0.2)
                                : Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            student['status'].toString().toUpperCase(),
                            style: TextStyle(
                              color: student['status'].toString().toLowerCase() == 'present'
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


