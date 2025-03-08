import 'package:animate_do/animate_do.dart';
import 'package:educationapk/bottombar/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void triggerAlarm() async {
  var androidDetails = const AndroidNotificationDetails(
    'alarm_channel',
    'Alarm Notifications',
    importance: Importance.max,
    priority: Priority.high,
    sound: RawResourceAndroidNotificationSound(
        'alarm'), // Ensure "alarm.mp3" exists in `res/raw`
  );

  var generalNotificationDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Alarm Triggered',
    "It's time for your task!",
    generalNotificationDetails,
  );
}

class AlarmScheduler extends StatefulWidget {
  @override
  _AlarmSchedulerState createState() => _AlarmSchedulerState();
}

class _AlarmSchedulerState extends State<AlarmScheduler> {
  List<Map<String, dynamic>> tasks = [];
  TimeOfDay? selectedTime;
  TextEditingController descriptionController = TextEditingController();
  int taskCounter = 1; // Start task numbering from 1

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleAlarm(String description, TimeOfDay time) async {
    DateTime now = DateTime.now();
    DateTime scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    int alarmId = scheduledTime.millisecondsSinceEpoch % 100000;
    bool isSet = await AndroidAlarmManager.oneShotAt(
      scheduledTime,
      alarmId,
      triggerAlarm, // 🔹 Now using the global function
      exact: true,
      wakeup: true,
    );

    if (isSet) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("Alarm set for ${time.format(context)}: $description")),
      );
      print("✅ Alarm scheduled for ${scheduledTime.toLocal()} - $description");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to set alarm")),
      );
      print("❌ Failed to schedule alarm");
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _addTask() {
    if (selectedTime != null && descriptionController.text.isNotEmpty) {
      setState(() {
        tasks.add({
          "taskNumber": taskCounter, // Assign task number
          "description": descriptionController.text,
          "time": selectedTime!,
        });
        _scheduleAlarm(descriptionController.text, selectedTime!);
        taskCounter++; // Increment task number
      });
      descriptionController.clear();
      selectedTime = null;
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      // Reassign task numbers after deletion
      for (int i = 0; i < tasks.length; i++) {
        tasks[i]["taskNumber"] = i + 1;
      }
      taskCounter = tasks.length + 1; // Update taskCounter
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Scrollable Content to Prevent Overflow
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left properly
                children: [
                  // Header Row (Back Button + Title)
                  SlideInRight(
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => MyMainHome());
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

                  // TextField
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

                  // Select Time Button
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

                  // Add Task Button
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: ElevatedButton(
                      onPressed: _addTask,
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
                    child: ListView.builder(
                      itemCount: tasks.length,
                      shrinkWrap: true, // Important to fit inside Column
                      physics: const NeverScrollableScrollPhysics(), // Prevent double scrolling
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "${tasks[index]["taskNumber"]}. ${tasks[index]["description"]}",
                            style: const TextStyle(
                              fontFamily: 'nexalight',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            tasks[index]["time"].format(context),
                            style: const TextStyle(
                              fontFamily: 'nexaheavy',
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
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
      ),);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager
      .initialize(); // 🔹 Ensure alarm manager is initialized
  runApp(MaterialApp(home: AlarmScheduler()));
}
