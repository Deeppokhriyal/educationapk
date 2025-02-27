import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

class AlarmScheduler extends StatefulWidget {
  @override
  _AlarmSchedulerState createState() => _AlarmSchedulerState();
}

class _AlarmSchedulerState extends State<AlarmScheduler> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  List<Map<String, dynamic>> tasks = [];
  TimeOfDay? selectedTime;
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
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
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }

    int alarmId = scheduledTime.millisecondsSinceEpoch % 100000;
    bool isSet = await AndroidAlarmManager.oneShotAt(
      scheduledTime,
      alarmId,
      triggerAlarm,
      exact: true,
      wakeup: true,
    );

    if (isSet) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Alarm set for ${time.format(context)}: $description")),
      );
      print("✅ Alarm scheduled for ${scheduledTime.toLocal()} - $description");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to set alarm")),
      );
      print("❌ Failed to schedule alarm");
    }
  }

  static void triggerAlarm() async {
    print("🚀 Alarm Triggered!");
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    var androidDetails = AndroidNotificationDetails(
      'alarm_channel',
      'Alarm Notifications',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('alarm'),
    );
    var generalNotificationDetails =
    NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Alarm Triggered',
      "It's time for your task!",
      generalNotificationDetails,
    );
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
          "description": descriptionController.text,
          "time": selectedTime!,
        });
        _scheduleAlarm(descriptionController.text, selectedTime!);
      });
      descriptionController.clear();
      selectedTime = null;
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alarm Scheduler")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Task Description"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickTime(context),
              child: Text("Select Time"),
            ),
            SizedBox(height: 20),
            Text(selectedTime != null
                ? "Selected Time: ${selectedTime!.format(context)}"
                : "No time selected"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTask,
              child: Text("Add Task"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]["description"]),
                    subtitle: Text(tasks[index]["time"].format(context)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

