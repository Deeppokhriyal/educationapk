import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
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

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Assignment Added!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Assignment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: "Subject")),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: "Description")),
            SizedBox(height: 10),

            // Deadline Date Picker
            GestureDetector(
              onTap: () => selectDeadline(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Deadline",
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
            SizedBox(height: 10),

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
            SizedBox(height: 10),

            ElevatedButton(onPressed: addQuestionField, child: Text("Add Question")),
            SizedBox(height: 20),

            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: addAssignment, child: Text("Add Assignment")),
          ],
        ),
      ),
    );
  }
}
