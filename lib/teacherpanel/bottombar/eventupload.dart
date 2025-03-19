import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Eventupload extends StatefulWidget {
  @override
  _EventuploadState createState() => _EventuploadState();
}

class _EventuploadState extends State<Eventupload> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _submitByController = TextEditingController();
  TextEditingController _rollNoController = TextEditingController();
  TextEditingController _leaveDateController = TextEditingController();
  TextEditingController _leaveReasonController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedValue;

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _leaveDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> submitLeaveApplication() async {
    if (_formKey.currentState!.validate()) {
      if (selectedValue == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select your branch!')),
        );
        return;
      }

      String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
      String rollNo = _rollNoController.text.trim(); // ✅ Roll Number as Unique ID

      try {
        await _firestore.collection('upcoming_events').doc(rollNo).set({  // ✅ Document ID = Roll No.
          'branch': selectedValue,
          'submitBy': currentUserId,
          'submitName': _submitByController.text, // ✅ Save student name
          'rollno': rollNo, // ✅ Save roll number
          'leaveDate': _leaveDateController.text,
          'leaveReason': _leaveReasonController.text,
          'submittedAt': FieldValue.serverTimestamp(),
          'status': 'Pending'
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Leave Event submitted successfully!')),
        );

        _submitByController.clear();
        _rollNoController.clear();
        _leaveDateController.clear();
        _leaveReasonController.clear();
        setState(() {
          selectedValue = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting Event. Try again!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.pinkAccent], // Three colors
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SlideInUp(
                  duration: Duration(milliseconds: 400),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Row(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        Text(' Upload upcoming Event',
                            style: TextStyle(
                                fontFamily: 'nexalight',
                                fontSize: 23,
                                color: Colors.white)),
                      ]),
                      SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _submitByController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'Enter Event Name',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter the Submission Name'
                                      : null,
                                ),SizedBox(height: 20),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _leaveDateController,
                                  style: TextStyle(color: Colors.white),
                                  readOnly: true,
                                  onTap: _pickDate,
                                  decoration: InputDecoration(
                                    labelText: 'Starting Date',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                    suffixIcon: Icon(Icons.calendar_today,
                                        color: Colors.white),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter a valid leave date'
                                      : null,
                                ),SizedBox(height: 20),
                                TextFormField(
                                  controller: _leaveDateController,
                                  style: TextStyle(color: Colors.white),
                                  readOnly: true,
                                  onTap: _pickDate,
                                  decoration: InputDecoration(
                                    labelText: 'Ending Date',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                    suffixIcon: Icon(Icons.calendar_today,
                                        color: Colors.white),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter a valid leave date'
                                      : null,
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: _leaveReasonController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                    hintText: 'Enter your reason for application',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 60.0, horizontal: 10.0),
                                    hintStyle: TextStyle(
                                        color: Colors.white54, fontSize: 15,fontFamily: 'nexalight'),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  maxLines: 3,
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter a reason for application'
                                      : null,
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: submitLeaveApplication,
                                  child: Text('Upload',
                                      style: TextStyle(
                                          fontFamily: 'nexaheavy',
                                          fontSize: 20,
                                          color: Colors.blue)),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
