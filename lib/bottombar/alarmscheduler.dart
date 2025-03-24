import 'package:animate_do/animate_do.dart';
import 'package:educationapk/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent_plus/android_intent.dart';

class AlarmScheduler extends StatefulWidget {
  @override
  _AlarmSchedulerState createState() => _AlarmSchedulerState();
}

class _AlarmSchedulerState extends State<AlarmScheduler> {
  List<Map<String, dynamic>> tasks = [];
  TimeOfDay? selectedTime;
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    if (await Permission.scheduleExactAlarm.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }
  }

  Future<void> _setAlarm(String description, TimeOfDay time) async {
    final androidIntent = AndroidIntent(
      action: 'android.intent.action.SET_ALARM',
      arguments: {
        'android.intent.extra.alarm.HOUR': time.hour,
        'android.intent.extra.alarm.MINUTES': time.minute,
        'android.intent.extra.alarm.MESSAGE': description,
      },
    );

    try {
      await androidIntent.launch();
      setState(() {
        tasks.add({'description': description, 'time': time});
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Alarm set for ${time.format(context)}')),
      );
    } catch (e) {
      print('Error launching alarm intent: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to set alarm. Please try manually.')),
      );
    }
  }

  Future<void> _openAlarmApp() async {
    final androidIntent = AndroidIntent(
      action: 'android.intent.action.SHOW_ALARMS',
    );

    try {
      await androidIntent.launch();
    } catch (e) {
      print('Error opening alarm app: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open alarm app.')),
      );
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? pickedTime =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideInRight(
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => Bottombar());
                          },
                          child: const Icon(Icons.arrow_back, size: 35),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Task's Scheduler",
                          style: TextStyle(fontFamily: 'nexaheavy', fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: TextField(
                      style: const TextStyle(fontFamily: 'nexalight', fontSize: 20),
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: "Create your Own Task",
                        labelStyle: TextStyle(
                          fontFamily: 'nexaheavy',
                          color: Colors.blue,
                          fontSize: 19,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: ElevatedButton(
                      onPressed: () => _pickTime(context),
                      child: const Text(
                        "Select Time",
                        style: TextStyle(
                          fontFamily: 'nexaheavy',
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Selected Time Text
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Text(
                      selectedTime != null
                          ? "Selected Time = ${selectedTime!.format(context)}"
                          : "Selected Time = _ _ : _ _",
                      style: const TextStyle(fontFamily: 'nexalight', fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 45),
    SlideInUp(
    duration: const Duration(milliseconds: 700),
    child:ElevatedButton(
                    onPressed: () {
                      if (selectedTime != null &&
                          descriptionController.text.isNotEmpty) {
                        _setAlarm(descriptionController.text, selectedTime!);
                        descriptionController.clear();
                        selectedTime = null;
                      }
                    },
                    child: const Text(
                      "Add Task",
                      style: TextStyle(
                        fontFamily: 'nexaheavy',
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),
    ),
                      const SizedBox(height: 40),

    // Task List (Fixed Layout Issues)
    SizedBox(
    height: 300, // Set height to prevent overflow
    child:ListView.builder(
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            "${tasks[index]["taskNumber"]}. ${tasks[index]["description"]}"),
                        subtitle: Text(tasks[index]["time"].format(context)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () { _deleteTask(index);
    _openAlarmApp();},
                        ),
                      );
                    },
                  ),
    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
