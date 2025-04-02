import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAttendancePage extends StatefulWidget {
  @override
  _AdminAttendancePageState createState() => _AdminAttendancePageState();
}

class _AdminAttendancePageState extends State<AdminAttendancePage> {
  final List<String> branchCollections = [
    'Agrifirst',
    'Agrisecond',
    'Agrithird',
    'CS1styear',
    'CS2ndyear',
    'CS3rdyear',
    'Chemfirst',
    'Chemsecond',
    'Chemthird',
    'Elecfirst',
    'Elecsecond',
    'Electhird',
    'Mechfirst',
    'Mechsecond',
    'Mechthird',
    'Paintfirst',
    'Paintsecond',
    'Paintthird',
    'attendance1styear',
    'attendance2ndyear',
    'attendance3rdyear',
    'Pharmacyfirst',
    'Pharmacysecond',
  ]; // Collection names for branches

  Future<Map<String, Map<String, int>>> fetchAttendance() async {
    Map<String, Map<String, int>> attendanceData = {};

    for (String collection in branchCollections) {
      try {
        QuerySnapshot dateSnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .orderBy('date', descending: true)
            .limit(1)
            .get();

        if (dateSnapshot.docs.isNotEmpty) {
          var latestDoc = dateSnapshot.docs.first;
          Map<String, dynamic> studentData = latestDoc.data() as Map<String, dynamic>;

          int presentCount = 0;
          int totalCount = studentData.length;

          studentData.forEach((key, value) {
            if (value is Map<String, dynamic> && value['status'] == 'present') {
              presentCount++;
            }
          });

          attendanceData[collection] = {
            'present': presentCount,
            'total': totalCount,
          };
        } else {
          attendanceData[collection] = {'present': 0, 'total': 0};
        }
      } catch (e) {
        print('Error fetching $collection: $e');
        attendanceData[collection] = {'present': 0, 'total': 0};
      }
    }
    return attendanceData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Overview'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchAttendance(),
        builder: (context, AsyncSnapshot<Map<String, Map<String, int>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          }

          final attendanceData = snapshot.data ?? {};

          return ListView.builder(
            itemCount: branchCollections.length,
            itemBuilder: (context, index) {
              String collection = branchCollections[index];
              int present = attendanceData[collection]?['present'] ?? 0;
              int total = attendanceData[collection]?['total'] ?? 0;
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(collection.replaceAll('Attendance', ''),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Present: $present / Total: $total'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
