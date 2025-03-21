import 'package:flutter/material.dart';

class Teacherdetails extends StatelessWidget {
  final List<Map<String, String>> staffMembers = [
    {'name': 'Mr. B.P.Singh', 'designation': 'Principal', 'image': 'assets/principal.png'},
  ];

  final List<Map<String, String>> officeStaff = [
    {'name': 'Mr. Kailash Singh', 'designation': 'Office staff', 'image': 'assets/hod_cs.png'},
    {'name': 'Mr. Shiv Kumar', 'designation': 'Office staff', 'image': 'assets/hod_mech.png'},
    {'name': 'Mr. Gokul Sunal', 'designation': 'Office staff', 'image': 'assets/professor.png'},
    {'name': 'Mr. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Surendra Ram', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Hemu Upadhyay', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mrs. Prema Devi', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Bhagawat Dayal', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Rameshwar Singh', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
  ];

  final List<Map<String, String>> teachers = [
    {'name': 'Kr. Anuradha', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Prashant Kumar', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Sri A.K.Agarwal', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Jeetesh Sundriyal', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri O.P.Singh', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Rajeev Yadav', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri R.S.Yadav', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Prince Chauhan', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Kumar Gaurv', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Km. Aasma', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Teacher Panel', style: TextStyle(fontFamily: 'nexaheavy', fontSize: 25)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Principal', staffMembers),
              Divider(thickness: 2),
              _buildSection('Office Staff', officeStaff),
              Divider(thickness: 2),
              _buildSection('Teachers', teachers),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> members) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        SizedBox(height: 10),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: members.length,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: EdgeInsets.only(right: 10),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(members[index]['image']!),
                      ),
                      SizedBox(height: 10),
                      Text(
                        members[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        members[index]['designation']!,
                        style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Teacherdetails(),
  ));
}
