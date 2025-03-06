import 'package:flutter/material.dart';

class Teacherdetails extends StatelessWidget {
  const Teacherdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Teacher Panel',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25),)
      ),
      body: Center(child: Text('HEllo')),
    );
  }
}
