import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventUpload extends StatefulWidget {
  const EventUpload({Key? key}) : super(key: key);

  @override
  _EventUploadState createState() => _EventUploadState();
}

class _EventUploadState extends State<EventUpload> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _eventNameController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      controller.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Future<void> uploadEvent() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      await _firestore.collection('events').add({
        'eventName': _eventNameController.text.trim(),
        'startDate': _startDateController.text.trim(),
        'endDate': _endDateController.text.trim(),
        'description': _descriptionController.text.trim(),
        'createdBy': userId,
        'createdAt': FieldValue.serverTimestamp(),
      });

      showAwesomeSnackBar(context,"Event uploaded successfully!",true);
      // Clear fields after submission
      _eventNameController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _descriptionController.clear();
    } catch (e) {
      showAwesomeSnackBar(context,"Failed to upload event",false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.lightBlue],
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SlideInUp(
                duration: const Duration(milliseconds: 400),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        const Text(
                          'Upload Upcoming Event',
                          style: TextStyle(
                            fontFamily: 'nexalight.heavy',
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              buildTextField(

                                controller: _eventNameController,
                                label: 'Enter Event Name',
                                validator: (value) => value!.isEmpty ? 'Enter the event name' : null,
                              ),
                              buildDatePickerField(
                                controller: _startDateController,
                                label: 'Starting Date',
                                onTap: () => _pickDate(_startDateController),
                              ),
                              buildDatePickerField(
                                controller: _endDateController,
                                label: 'Ending Date',
                                onTap: () => _pickDate(_endDateController),
                              ),
                              buildTextField(
                                controller: _descriptionController,
                                label: 'Description',
                                maxLines: 3,
                                validator: (value) => value!.isEmpty ? 'Enter event description' : null,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: uploadEvent,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Upload',
                                  style: TextStyle(
                                    fontFamily: 'nexaheavy',
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white, fontFamily: 'nexalight'),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        maxLines: maxLines,
        validator: validator,
      ),
    );
  }

  Widget buildDatePickerField({
    required TextEditingController controller,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white, fontFamily: 'nexalight'),
          suffixIcon: const Icon(Icons.calendar_today, color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        validator: (value) => value!.isEmpty ? 'Select a date' : null,
      ),
    );
  }
}
