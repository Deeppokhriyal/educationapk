import 'package:educationapk/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart'; // For date formatting

class TeacherAssignmentScreen extends StatefulWidget {
  @override
  _TeacherAssignmentScreenState createState() => _TeacherAssignmentScreenState();
}

class _TeacherAssignmentScreenState extends State<TeacherAssignmentScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<TextEditingController> questionControllers = [];
  DateTime? selectedDeadline;
  bool isLoading = false;

  void addQuestionField() {
    setState(() {
      questionControllers.add(TextEditingController());
    });
  }

  void removeQuestionField(int index) {
    setState(() {
      questionControllers.removeAt(index);
    });
  }

  Future<void> selectDeadline(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDeadline ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDeadline = picked;
      });
    }
  }

  Future<void> addAssignment() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedDeadline == null ||
        questionControllers.isEmpty) {
      showAwesomeSnackBar(context,"Please fill all fields",false);
      return;
    }

    setState(() {
      isLoading = true;
    });

    List<String> questions = questionControllers.map((controller) => controller.text).toList();

    await FirebaseFirestore.instance.collection('assignments').add({
      'subject': titleController.text,
      'description': descriptionController.text,
      'deadline': DateFormat('yyyy-MM-dd').format(selectedDeadline!), // Formatting the date
      'questions': questions,
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() {
      isLoading = false;
      titleController.clear();
      descriptionController.clear();
      selectedDeadline = null;
      questionControllers.clear();
    });

    showAwesomeSnackBar(context,"Assignment Added!",true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Assignment",
          style: TextStyle(fontFamily: 'nexaheavy', fontSize: 24, color: Colors.lightBlue),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80), // Adjust to prevent overlap with button
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Divider(color: Colors.lightBlue, thickness: 3),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Subject",
                    labelStyle: TextStyle(fontFamily: 'nexalight', fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),

                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(fontFamily: 'nexalight', fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),

                // Deadline Date Picker
                GestureDetector(
                  onTap: () => selectDeadline(context),
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Deadline",
                        labelStyle: TextStyle(fontFamily: 'nexalight', fontSize: 18),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                        text: selectedDeadline != null
                            ? DateFormat('yyyy-MM-dd').format(selectedDeadline!)
                            : "",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Dynamic Question Fields
                Column(
                  children: [
                    for (int i = 0; i < questionControllers.length; i++)
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: questionControllers[i],
                              decoration: InputDecoration(labelText: "Question ${i + 1}"),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () => removeQuestionField(i),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: addQuestionField,
                  child: Text("Add Question", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20, color: Colors.lightBlue)),
                ),
              ],
            ),
          ),

          // Fixed Upload Button at the Bottom
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: isLoading ? null : addAssignment,
              child: isLoading
                  ? SpinKitCircle(color: Colors.white)
                  : Text("Upload Assignment", style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
