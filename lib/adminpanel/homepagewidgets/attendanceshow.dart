import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      '1st Year': 'CHEM1styear',
      '2nd Year': 'CHEM2ndyear',
      '3rd Year': 'CHEM3rdyear',
    },
    'CHEM. PAINT': {
      '1st Year': 'CHEMP1styear',
      '2nd Year': 'CHEMP2ndyear',
      '3rd Year': 'CHEMP3rdyear',
    },
    'ELECTRONICS': {
      '1st Year': 'ELE1styear',
      '2nd Year': 'ELE2ndyear',
      '3rd Year': 'ELE3rdyear',
    },
    'PHARMACY': {
      '1st Year': 'PHAR1styear',
      '2nd Year': 'PHAR2ndyear',
      '3rd Year': 'PHAR3rdyear',
    },
    'MECHANICAL': {
      '1st Year': 'MECH1styear',
      '2nd Year': 'MECH2ndyear',
      '3rd Year': 'MECH3rdyear',
    },
    'AGRICULTURE': {
      '1st Year': 'CS1sty ar',
      '2nd Year': 'CS2ndyear',
      '3rd Year': 'CS3rdyear',
    },
    'CIVIL': {
      '1st Year': 'CIVIL1styear',
      '2nd Year': 'CIVIL2ndy ear',
      '3rd Year': 'CIVIL3rdyear',
    },

    // Add more branches here later
  };

  String? selectedBranch;
  String? selectedYear;
  DateTime? selectedDate;
  int presentCount = 0;
  int totalCount = 0;

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
      fetchAttendance();
    }
  }

  Future<void> fetchAttendance() async {
    if (selectedBranch == null || selectedYear == null || selectedDate == null) return;

    String collectionPath = branchCollections[selectedBranch]![selectedYear]!;
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(formattedDate)
          .get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        int present = 0;
        int total = data.length;

        data.forEach((key, value) {
          if (value.toString().toLowerCase() == 'present') present++;
        });

        setState(() {
          presentCount = present;
          totalCount = total;
        });
      } else {
        setState(() {
          presentCount = 0;
          totalCount = 0;
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Attendance Page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ...branchCollections.entries.map((branch) {
            return Card(
              elevation: 4,
              child: ExpansionTile(
                title: Text(branch.key, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                children: branch.value.entries.map((yearEntry) {
                  return ListTile(
                    title: Text(yearEntry.key),
                    trailing: Icon(Icons.calendar_month),
                    onTap: () async {
                      setState(() {
                        selectedBranch = branch.key;
                        selectedYear = yearEntry.key;
                      });
                      await _pickDate();
                    },
                  );
                }).toList(),
              ),
            );
          }).toList(),
          if (selectedBranch != null && selectedYear != null && selectedDate != null)
            Container(
              margin: EdgeInsets.only(top: 20),
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
                  Text("Year: $selectedYear", style: TextStyle(fontSize: 16)),
                  Text("Date: ${DateFormat('dd MMM yyyy').format(selectedDate!)}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Attendance: $presentCount / $totalCount Present", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            )
        ],
      ),
    );
  }
}
