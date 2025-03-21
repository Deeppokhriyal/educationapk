import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Agrifirst extends StatefulWidget {
  const Agrifirst({super.key});

  @override
  _AgrifirstState createState() => _AgrifirstState();
}

class _AgrifirstState extends State<Agrifirst> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ Ensured "id" values are correctly formatted and displayed
  List<Map<String, dynamic>> students = [
    { "id": 1, "name": "Aksa Noori", "status": "Absent" },
    { "id": 2, "name": "Alfaiz Ahmad", "status": "Absent" },
    { "id": 3, "name": "Ankit", "status": "Absent" },
    { "id": 4, "name": "Anshu Mandal", "status": "Absent" },
    { "id": 5, "name": "Anshu Rawat", "status": "Absent" },
    { "id": 6, "name": "Aryan Gusain", "status": "Absent" },
    { "id": 7, "name": "Ashu", "status": "Absent" },
    { "id": 8, "name": "Ayush Rudhiyal", "status": "Absent" },
    { "id": 9, "name": "Deepu Kumar", "status": "Absent" },
    { "id": 10, "name": "Dhruv Bharti", "status": "Absent" },
    { "id": 11, "name": "Dinesh Kumar Arya", "status": "Absent" },
    { "id": 12, "name": "Gaurav Gusain", "status": "Absent" },
    { "id": 13, "name": "Harkesh Singh", "status": "Absent" },
    { "id": 14, "name": "Himesh Kanyal", "status": "Absent" },
    { "id": 15, "name": "Jyoti Bisht", "status": "Absent" },
    { "id": 16, "name": "Kapil", "status": "Absent" },
    { "id": 17, "name": "Kartik Rawat", "status": "Absent" },
    { "id": 18, "name": "KM Sunita", "status": "Absent" },
    { "id": 19, "name": "Lalit Singh", "status": "Absent" },
    { "id": 20, "name": "Mamta Bisht", "status": "Absent" },
    { "id": 21, "name": "Manisha", "status": "Absent" },
    { "id": 22, "name": "Mohd Aakif", "status": "Absent" },
    { "id": 23, "name": "Pankaj Uniyal", "status": "Absent" },
    { "id": 24, "name": "Parth Mathpal", "status": "Absent" },
    { "id": 25, "name": "Pawan Singh", "status": "Absent" },
    { "id": 26, "name": "Payal", "status": "Absent" },
    { "id": 27, "name": "Piyush Saini", "status": "Absent" },
    { "id": 28, "name": "Pradeep Kumar Yadav", "status": "Absent" },
    { "id": 29, "name": "Prakarti Chabra", "status": "Absent" },
    { "id": 30, "name": "Priyanshu Yadav", "status": "Absent" },
    { "id": 31, "name": "Raghav", "status": "Absent" },
    { "id": 32, "name": "Ritesh Sirohi", "status": "Absent" },
    { "id": 33, "name": "Ritesh Yadav", "status": "Absent" },
    { "id": 34, "name": "Rohit Kumar", "status": "Absent" },
    { "id": 35, "name": "Safiya", "status": "Absent" },
    { "id": 36, "name": "Saksham Bhardwaj", "status": "Absent" },
    { "id": 37, "name": "Shifa", "status": "Absent" },
    { "id": 38, "name": "Shobhit Kumar", "status": "Absent" },
    { "id": 39, "name": "Sohan Mandal", "status": "Absent" },
    { "id": 40, "name": "Sunil Singh Rawat", "status": "Absent" },
    { "id": 41, "name": "Tushar Kumar", "status": "Absent" },
    { "id": 42, "name": "Yogesh Kumar", "status": "Absent" }
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

    await _firestore.collection("Agrifirst").doc(todayDate).set({
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