import 'package:animate_do/animate_do.dart';
import 'package:educationapk/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int taskCounter = 1;

  bool get wantKeepAlive => true; // Keeps widget alive

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
        tasks.add({
          'taskNumber': taskCounter++, // Assign and increment task number
          'description': description,
          'time': time
        });
      });
      showAwesomeSnackBar(context,'Alarm set for ${time.format(context)}',true);
    } catch (e) {
      print('Error launching alarm intent: $e');
      showAwesomeSnackBar(context,'Failed to set alarm. Please try manually.',false);
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
      showAwesomeSnackBar(context,'Failed to open alarm app.',false);
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);

      // Reassign task numbers after deletion
      for (int i = 0; i < tasks.length; i++) {
        tasks[i]['taskNumber'] = i + 1;
      }
      taskCounter = tasks.length + 1;
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
              padding:EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
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
                          child: Icon(Icons.arrow_back, size: 35.r),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          "Task's Scheduler",
                          style: TextStyle(fontFamily: 'nexaheavy', fontSize: 28.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: TextField(
                      style: TextStyle(fontFamily: 'nexalight', fontSize: 20.sp),
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: "Create your Own Task",
                        labelStyle: TextStyle(
                          fontFamily: 'nexaheavy',
                          color: Colors.blue,
                          fontSize: 19.sp,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0.w),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.5.w),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: ElevatedButton(
                      onPressed: () => _pickTime(context),
                      child: Text(
                        "Select Time",
                        style: TextStyle(
                          fontFamily: 'nexaheavy',
                          fontSize: 18.sp,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Selected Time Text
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Text(
                      selectedTime != null
                          ? "Selected Time = ${selectedTime!.format(context)}"
                          : "Selected Time = _ _ : _ _",
                      style: TextStyle(fontFamily: 'nexalight', fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(height: 45.h),
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
                    child: Text(
                      "Add Task",
                      style: TextStyle(
                        fontFamily: 'nexaheavy',
                        fontSize: 20.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
    ),
                      SizedBox(height: 40.h),

    // Task List (Fixed Layout Issues)
    SizedBox(
    height: 300.h, // Set height to prevent overflow
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
