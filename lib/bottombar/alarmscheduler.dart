import 'package:animate_do/animate_do.dart';
import 'package:educationapk/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

Future<void> requestPermissions() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }

  // Request SET_ALARM permission (for specific Android versions)
  if (await Permission.scheduleExactAlarm.isDenied) {
    await Permission.scheduleExactAlarm.request();
  }
}


Future<void> setDeviceAlarm(String message, int hour, int minute) async {
  print("Attempting to set device alarm: $message at $hour:$minute");

  try {
    final intent = AndroidIntent(
      action: 'android.intent.action.SET_ALARM',
      arguments: {
        'android.intent.extra.alarm.MESSAGE': message,
        'android.intent.extra.alarm.HOUR': hour,
        'android.intent.extra.alarm.MINUTES': minute,
        'android.intent.extra.alarm.SKIP_UI': false,
      },
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();

    print("Alarm intent launched successfully");
  } catch (e) {
    print("Error launching alarm intent: $e");
  }
}

Future<void> cancelDeviceAlarm(String message) async {
  try {
    final intent = AndroidIntent(
      action: 'android.intent.action.CANCEL_ALARM',
      arguments: {
        'android.intent.extra.alarm.MESSAGE': message,
      },
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  } catch (e) {
    print("Error cancelling alarm: $e");
  }
}

class AlarmScheduler extends StatefulWidget {
  @override
  _AlarmSchedulerState createState() => _AlarmSchedulerState();
}

class _AlarmSchedulerState extends State<AlarmScheduler> {
  List<Map<String, dynamic>> tasks = [];
  TimeOfDay? selectedTime;
  TextEditingController descriptionController = TextEditingController();
  int taskCounter = 1;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> _scheduleAlarm(String description, TimeOfDay time) async {
    await setDeviceAlarm(description, time.hour, time.minute);

    setState(() {
      tasks.add({
        "taskNumber": taskCounter++,
        "description": description,
        "time": time,
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Alarm set for ${time.format(context)}: $description")),
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _deleteTask(int index) async {
    String description = tasks[index]["description"];

    // Cancel the corresponding alarm on the device
    await cancelDeviceAlarm(description);

    setState(() {
      tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task removed successfully")),
    );
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
                      if (selectedTime != null && descriptionController.text.isNotEmpty) {
                        _scheduleAlarm(descriptionController.text, selectedTime!);
                        descriptionController.clear();
                        selectedTime = null;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter description and select time")),
                        );
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
                          onPressed: () => _deleteTask(index),
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
