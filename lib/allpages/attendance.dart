// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class AttendancePage extends StatefulWidget {
//   @override
//   _AttendancePageState createState() => _AttendancePageState();
// }
//
// class _AttendancePageState extends State<AttendancePage> {
//   String selectedDate = DateTime.now().toString().split(" ")[0]; // Default date (today)
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Attendance History"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.calendar_today),
//             onPressed: () {
//               _selectDate(context);
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('attendance')
//             .doc(selectedDate)
//             .collection('students')
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text("No attendance records found."));
//           }
//
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var student = snapshot.data!.docs[index];
//               return ListTile(
//                 leading: CircleAvatar(child: Text(student['roll'].toString())),
//                 title: Text(student['name']),
//                 subtitle: Text("Status: ${student['status']}"),
//                 trailing: student['status'] == "Present"
//                     ? Icon(Icons.check_circle, color: Colors.green)
//                     : Icon(Icons.cancel, color: Colors.red),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   /// 📆 Date Picker Function
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2024),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
//       });
//     }
//   }
// }
//




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
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
    await _firestore.collection("attendance3rdyear").doc(date).get();

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
        title: Text("Attendance History",style: TextStyle(fontFamily: 'nexaheavy'),),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(selectedDate == null
                  ? "Select Date"
                  : "Date: $selectedDate"),
            ),
          ),
          Expanded(
            child: attendanceRecords.isEmpty
                ? Center(child: Text("No records found"))
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





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class AttendancePage extends StatefulWidget {
//   @override
//   _AttendancePageState createState() => _AttendancePageState();
// }
//
// class _AttendancePageState extends State<AttendancePage> {
//   String selectedDate = "2025-02-25"; // Default Date (Change Dynamically)
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Attendance History"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.calendar_today),
//             onPressed: () {
//               _selectDate(context);
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('attendance')
//             .doc(selectedDate) // Fetch data of selected date
//             .collection('students')
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text("No attendance records found."));
//           }
//
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var student = snapshot.data!.docs[index];
//               return ListTile(
//                 leading: CircleAvatar(child: Text(student['roll'].toString())),
//                 title: Text(student['name']),
//                 subtitle: Text("Status: ${student['status']}"),
//                 trailing: student['status'] == "Present"
//                     ? Icon(Icons.check_circle, color: Colors.green)
//                     : Icon(Icons.cancel, color: Colors.red),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   /// 📆 Date Picker Function
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2024),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
//       });
//     }
//   }
// }
