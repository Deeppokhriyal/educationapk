import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LeaveApplication extends StatefulWidget {
  @override
  _LeaveApplicationState createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  final _formKey = GlobalKey<FormState>();
  bool isUpdating = false;

  TextEditingController _submitByController = TextEditingController();
  TextEditingController _rollNoController = TextEditingController();
  TextEditingController _leaveDateController = TextEditingController();
  TextEditingController _tillleaveDateController = TextEditingController();
  TextEditingController _leaveReasonController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedValue;

  final List<String> items = [
    'IT',
    'AGRICULTURE',
    'CHEMICAL',
    'PAINT',
    'CIVIL',
    'CSE',
    'ELEX',
    'MECH',
    'PHARMACY',
  ];

  Future<void> _pickDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> submitLeaveApplication() async {
    if (_formKey.currentState!.validate()) {
      if (selectedValue == null) {
        showAwesomeSnackBar(context,'Please select your branch!',false);
        return;
      }

      setState(() {
        isUpdating = true; // Show loading animation before starting
      });

      String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
      String rollNo = _rollNoController.text.trim();

      try {
        await _firestore.collection('leave_applications').doc(rollNo).set({
          'branch': selectedValue,
          'submitBy': currentUserId,
          'submitName': _submitByController.text,
          'rollno': rollNo,
          'leaveDate': _leaveDateController.text,
          'tillleaveDate': _tillleaveDateController.text,
          'leaveReason': _leaveReasonController.text,
          'submittedAt': FieldValue.serverTimestamp(),
          'status': 'Pending'
        });
        showAwesomeSnackBar(context, "Leave application submitted successfully!", true);

        _submitByController.clear();
        _rollNoController.clear();
        _leaveDateController.clear();
        _tillleaveDateController.clear();
        _leaveReasonController.clear();
        setState(() {
          selectedValue = null;
        });
      } catch (e) {
        // Log the error message
        print('Error submitting application: $e');
        showAwesomeSnackBar(context, 'Error submitting application. Try again!', false);
      } finally {
        setState(() {
          isUpdating = false;
        });
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
                  colors: [Colors.black87, Colors.deepPurpleAccent], // Three colors
                  begin: Alignment.topRight,
                  end: Alignment.centerLeft,
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
                        Text(' Leave Application',
                            style: TextStyle(
                                fontFamily: 'nexalight',
                                fontSize: 24,
                                color: Colors.white)),
                      ]),
                      SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  dropdownColor: Colors.deepPurpleAccent,
                                  decoration: InputDecoration(

                                    labelText: 'Select Your Branch',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                    fillColor: Colors.purple
                                  ),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'nexalight'),
                                  borderRadius: BorderRadius.circular(40),
                                  value: selectedValue,
                                  items: items.map((String item) {
                                    return DropdownMenuItem<String>(
                                        value: item, child: Text(item));
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue;
                                    });
                                  },
                                  validator: (value) => value == null
                                      ? 'Please select your branch'
                                      : null,
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _submitByController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'Submit Name',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter the Submission Name'
                                      : null,
                                ),SizedBox(height: 20),
                                TextFormField(
                                  controller: _rollNoController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'UBTER Roll No.',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter the UBTER Roll No.'
                                      : null,
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _leaveDateController,
                                  style: TextStyle(color: Colors.white),
                                  readOnly: true,
                                  onTap: () => _pickDate(_leaveDateController),
                                  decoration: InputDecoration(
                                    labelText: 'Leave Date',
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
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _tillleaveDateController,
                                  style: TextStyle(color: Colors.white),
                                  readOnly: true,
                                  onTap: () => _pickDate(_tillleaveDateController),
                                  decoration: InputDecoration(
                                    labelText: 'Till Leave Date',
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'nexalight'),
                                    suffixIcon: Icon(Icons.calendar_today,
                                        color: Colors.white),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter a valid Till leave date'
                                      : null,
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: _leaveReasonController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'Reason',
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
                                isUpdating
                                    ? SpinKitThreeInOut(
                                  color: Colors.white, // Adjust color
                                  size: 30.0,          // Adjust size
                                )
                                    :                                ElevatedButton(
                                  onPressed: submitLeaveApplication,
                                  child: Text('Submit',
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
        floatingActionButton: SlideInDown(
          duration: Duration(milliseconds: 300),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21
            )),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveStatusPage()));
            },
            tooltip: 'History',
            backgroundColor: Colors.white,
            child: Icon(Icons.history, color: Colors.purpleAccent, size: 33),
          ),
        )
    );
  }
}

// History  History  History  History  History  History  History  History  History  History  History

class LeaveStatusPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String? currentUserId = _auth.currentUser?.uid;

    if (currentUserId == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Leave Application Status', style: TextStyle(fontFamily: 'nexaheavy')),
        ),
        body: Center(
          child: Text('User not logged in', style: TextStyle(fontSize: 18, fontFamily: 'nexaheavy')),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text(
          'Leave Application Status',
          style: TextStyle(fontFamily: 'nexaheavy'),
        ),
      ),
      body: StreamBuilder(
        stream: _firestore
            .collection('leave_applications')
            .where('submitBy', isEqualTo: currentUserId) // ✅ Only current user's applications
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent));
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No applications found',
                style: TextStyle(fontFamily: 'nexaheavy', fontSize: 18),
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              String status = doc['status'];
              Color statusColor;

              if (status == 'Approved') {
                statusColor = Colors.green;
              } else if (status == 'Declined') {
                statusColor = Colors.red;
              } else {
                statusColor = Colors.blue;
              }

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: ListTile(
                  title: Text(
                    'Student: ${doc['submitName']} (Roll No: ${doc['rollno']})',
                    style: TextStyle(fontFamily: 'nexaheavy', color: Colors.black, fontSize: 18),
                  ),
                  subtitle: Text(
                    'Status: ${doc['status']}',
                    style: TextStyle(fontFamily: 'nexalight', color: statusColor, fontSize: 18),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
