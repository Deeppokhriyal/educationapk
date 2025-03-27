import 'package:flutter/material.dart';

class Teacherdetails extends StatelessWidget {
  final List<Map<String, String>> staffMembers = [
    {'name': 'Mr. B.P.Singh', 'designation': 'Principal', 'image': 'assets/images/man.png'},
  ];

  final List<Map<String, String>> officeStaff = [
    {'name': 'Mr. Kailash Singh', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Shiv Kumar', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Gokul Sunal', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
    {'name': 'Mr. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Surendra Ram', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Hemu Upadhyay', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
    {'name': 'Mrs. Prema Devi', 'designation': 'Office staff', 'image': 'assets/images/woman.png'},
    {'name': 'Mr. Bhagawat Dayal', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Rameshwar Singh', 'designation': 'Office staff', 'image': 'assets/images/man.png'},
  ];

  final List<Map<String, String>> teachers = [
    {'name': 'Miss. Anuradha', 'designation': 'Agriculture Eng.', 'image': 'assets/images/woman.png'},
    {'name': 'Shri Prashant Kumar', 'designation': 'Chemical Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Sri A.K.Agarwal', 'designation': 'Chemical Paint Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Hari Datt Bhatt', 'designation': 'Civil Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Gaurav K. Upadhyay', 'designation': 'CS', 'image': 'assets/images/man.png'},
    {'name': 'Shri Rajeev Yadav', 'designation': 'Electronics ', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Jagdish C. Pandey', 'designation': 'IT', 'image': 'assets/images/man.png'},
    {'name': 'Mr. Jeetesh Sundriyal', 'designation': 'Mechanical Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Mrs. Preeti Arya', 'designation': 'Pharmacy ', 'image': 'assets/images/woman.png'},
  ];

  final List<Map<String, String>> lectuerteachers = [
    {'name': 'Kr. Anuradha', 'designation': 'Agriculture Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Shri Prashant Kumar', 'designation': 'Chemical Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Sri A.K.Agarwal', 'designation': 'Chemical Paint Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Mr. M.K. Joshi', 'designation': 'Civil Eng.', 'image': 'assets/images/woman.png'},
    {'name': 'Shri O.P.Singh', 'designation': 'Computer Science and Eng.', 'image': 'assets/images/woman.png'},
    {'name': 'Shri Rajeev Yadav', 'designation': 'Electronics ', 'image': 'assets/images/man.png'},
    {'name': 'Shri R.S.Yadav', 'designation': 'Information Technology', 'image': 'assets/images/woman.png'},
    {'name': 'Shri Prince Chauhan', 'designation': 'Mechanical Eng.', 'image': 'assets/images/man.png'},
    {'name': 'Shri Kumar Gaurv', 'designation': 'Pharmacy ', 'image': 'assets/images/woman.png'},
  ];

  final List<Map<String, String>> guesteachers = [
    {'name': 'Kr. Anuradha', 'designation': 'Agriculture Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Shri Prashant Kumar', 'designation': 'Chemical Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Sri A.K.Agarwal', 'designation': 'Chemical Paint Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Nitin Chandra', 'designation': 'Civil Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Miss. Himani Rawat', 'designation': 'Civil Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Shri O.P.Singh', 'designation': 'Computer Science and Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Shri Rajeev Yadav', 'designation': 'Electronics ', 'image': 'assets/librarian.png'},
    {'name': 'Shri R.S.Yadav', 'designation': 'Information Technology', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Gaurav Shriwal', 'designation': 'Mechanical Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Miss. Shweta Gola', 'designation': 'Mechanical Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Arjun Agarwal', 'designation': 'Mechanical Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Pankaj Kumar', 'designation': 'Mechanical Eng.', 'image': 'assets/librarian.png'},
    {'name': 'Shri Kumar Gaurv', 'designation': 'Pharmacy ', 'image': 'assets/librarian.png'},
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
              _buildSection('HOD (Head of Department)', teachers),
              Divider(thickness: 2),
              _buildSection('Lecturers', lectuerteachers),
              Divider(thickness: 2),
              _buildSection('Guest Teachers', guesteachers),
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
