import 'package:flutter/material.dart';

class Teacherdetails extends StatelessWidget {
  final List<Map<String, String>> staffMembers = [
    {'name': 'Mr. B.P.Singh', 'designation': 'Principal', 'image': 'assets/principal.png'},
    {'name': 'Mr. Kailash Singh', 'designation': 'Office staff', 'image': 'assets/hod_cs.png'},
    {'name': 'Mr.Shiv Kumar', 'designation': 'Office staff', 'image': 'assets/hod_mech.png'},
    {'name': 'Mr. Gokul Sunal', 'designation': 'Office staff', 'image': 'assets/professor.png'},
    {'name': 'Mr. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Surendra Ram', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Hemu Upadhyay', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mrs. Prema Devi', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Bhagawat Dayal', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Mr. Rameshwar Singh', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Kr. Anuradha', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Prashant Kumar ', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Sri A.K.Agarwal', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Jeetesh Sundriyal', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri O.P.Singh', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Rajeev Yadav', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri R.S.Yadav', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Prince Chauhan', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri Kumar Gaurv', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Km. Aasma', 'designation': 'Mechanical', 'image': 'assets/librarian.png'},
    {'name': 'Shri G.P. Chandra', 'designation': 'Office Draftsman', 'image': 'assets/librarian.png'},
    {'name': 'Shri Istikar Hussain', 'designation': 'Chemical Paint', 'image': 'assets/librarian.png'},
    {'name': 'Dr. Ompal Singh', 'designation': 'Chemical Paint', 'image': 'assets/librarian.png'},
    {'name': 'Shri Rajeev Yadav', 'designation': 'Chemical Paint', 'image': 'assets/librarian.png'},
    {'name': 'Shri Ramakbal Yadav', 'designation': 'Chemical Pait', 'image': 'assets/librarian.png'},
    {'name': 'Ms. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Ms. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Ms. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Ms. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
    {'name': 'Ms. M.S.Manral', 'designation': 'Office staff', 'image': 'assets/librarian.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Teacher Panel',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: staffMembers.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(staffMembers[index]['image']!),
                  ),
                  SizedBox(height: 10),
                  Text(
                    staffMembers[index]['name']!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    staffMembers[index]['designation']!,
                    style: TextStyle(color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Teacherdetails(),
  ));
}
