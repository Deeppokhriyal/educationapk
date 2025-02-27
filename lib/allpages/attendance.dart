import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String selectedDate = DateTime.now().toString().split(" ")[0]; // Default date (today)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance History"),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('attendance')
            .doc(selectedDate)
            .collection('students')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No attendance records found."));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var student = snapshot.data!.docs[index];
              return ListTile(
                leading: CircleAvatar(child: Text(student['roll'].toString())),
                title: Text(student['name']),
                subtitle: Text("Status: ${student['status']}"),
                trailing: student['status'] == "Present"
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Icon(Icons.cancel, color: Colors.red),
              );
            },
          );
        },
      ),
    );
  }

  /// 📆 Date Picker Function
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
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
