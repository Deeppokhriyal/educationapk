import 'package:flutter/material.dart';

class LeaveApplication extends StatefulWidget {
  @override
  _LeaveApplicationState createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  final _formKey = GlobalKey<FormState>();

  String Submitto = '';
  String leaveDate = '';
  String reason = '';

  void submitApplication() {
    if (_formKey.currentState!.validate()) {
      // Backend API call to submit leave application
      // Example: Firebase Firestore
      // Firestore.instance.collection('leave_applications').add({
      //   'studentId': 'student_id',
      //   'teacherId': 'teacher_id',
      //   'leaveDate': leaveDate,
      //   'reason': reason,
      //   'status': 'Pending',
      // });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Application Submitted',style: TextStyle(fontSize: 15,fontFamily: 'nexalight',color: Colors.lightBlueAccent),)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://img.freepik.com/free-vector/pink-neon-synthwave-patterned-social-story-template-vector_53876-176441.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsets.only(top: 55),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                      Text(' Leave Application',style: TextStyle(fontFamily: 'nexalight',fontSize: 24,color: Colors.white),),
                    ],
                  ),
                ),
                  SizedBox(height: 50,),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white,fontFamily: 'nexalight'),

                          decoration: InputDecoration(labelText: 'Submit to',labelStyle: TextStyle(fontFamily: 'nexalight',color: Colors.white)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Submit Information';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            leaveDate = value;
                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          style: TextStyle(color: Colors.white,fontFamily: 'nexalight'),

                          decoration: InputDecoration(labelText: 'Leave Date',labelStyle: TextStyle(fontFamily: 'nexalight',color: Colors.white)),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter leave date';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            leaveDate = value;
                          },
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          style: TextStyle(color: Colors.white,fontFamily: 'nexalight'),
                          decoration: InputDecoration(
                            labelText: 'Reason',
                            labelStyle: TextStyle(
                              color: Colors.white, fontFamily: 'nexalight' // Change this color to your desired label color
                            ),
                            hintText: '  Enter your reason for Application',
                            contentPadding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0), // Increase height
                            hintStyle: TextStyle(fontFamily: 'nexalight',color: Colors.white54,fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue), // Focused border color
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: submitApplication,
                          child: Text('Submit',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 20,color: Colors.blue),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    ]
      ),
    );
  }
}