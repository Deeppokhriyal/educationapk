import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/bottombar/homepage.dart';
import 'package:educationapk/teacherpanel/bottombar/teacherbottom.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bottombar/application.dart';
import 'bottombar/profilepage.dart';
import 'bottombar/schedulerstart.dart';
import 'controllers/user_controller.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await AndroidAlarmManager
//       .initialize(); // 🔹 Ensure alarm manager is initialized
//   runApp(MaterialApp(home: AlarmScheduler()));
// }
@pragma('vm:entry-point')
 void printHello() {
final DateTime now = DateTime.now();
final int isolateId = Isolate.current.hashCode;
print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AndroidAlarmManager.initialize();

  var androidInitialize =
  const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
  InitializationSettings(android: androidInitialize);
  final int helloAlarmID = 0;
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, printHello);

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _showLoader = false; // To control loader visibility

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds :  2000), () {
      setState(() {
        _showLoader = true; // Show loader after 3 seconds
      });
      checkLoginStatus();
    });
  }

  void checkLoginStatus() async {
    User? user = auth.currentUser;

    if (user != null) {
      DocumentSnapshot userData =
      await firestore.collection("users").doc(user.uid).get();

      if (userData.exists) {
        String role = userData['role'];

        if (role == "teacher") {
          Get.off(() => Teacherbar());
        } else if (role == "student") {
          Get.off(() => Bottombar());
        } else {
          Get.off(() => MyLogin());
        }
      } else {
        Get.off(() => MyLogin());
      }
    } else {
      Get.off(() => MyLogin());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _showLoader
            ? SpinKitWaveSpinner(
          color: Colors.blue, // Customize color
          size: 70.0, // Customize size
        )
            : Image.asset('assets/images/clgbglogo.png'), // Show logo first
      ),
    );
  }
}

void triggerAlarm() async {
  // print("Alarm Triggered!");

  var androidDetails = const AndroidNotificationDetails(
    'alarm_channel',
    'Alarm Notifications',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('alarm'),
  );

  var generalNotificationDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    '⏰ Alarm!',
    "It's time for your task!",
    generalNotificationDetails,
  );
}

Future<void> scheduleAlarm(DateTime alarmTime) async {
  // print("✅ Alarm scheduled for $alarmTime");
  await AndroidAlarmManager.oneShotAt(
    alarmTime,
    0,
    triggerAlarm,
    exact: true,
    wakeup: true,
  );
}
class Bottombar extends StatefulWidget {
  final int initialIndex;

  const Bottombar({super.key, this.initialIndex = 0}); // Default index = 0

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return; // Prevent unnecessary reloads
   Get.offAll(()=> Bottombar(initialIndex: index));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      MyMainHome(),
      Schedulerstart(),
      LeaveApplication(),
      ProfilePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex], // Correctly displays the selected page
      bottomNavigationBar: SizedBox(
        height: 70,
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.blue,
          tabBackgroundColor: Colors.lightBlueAccent[100]!,
          gap: 5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          onTabChange: (index) {
            _onItemTapped(index); // Use the function to handle navigation
          },
          selectedIndex: _selectedIndex, // Ensure the correct tab is highlighted
          tabs: const [
            GButton(icon: Icons.home, iconSize: 25, text: 'Home'),
            GButton(icon: Icons.timer, iconSize: 25, text: 'Scheduler'),
            GButton(icon: Icons.library_books_outlined, iconSize: 25, text: 'Application'),
            GButton(icon: Icons.person, iconSize: 25, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}

void logout() async {
  await FirebaseAuth.instance.signOut();
  Get.offAll(() => MyLogin());
}

void requestPermissions() async {
  await Permission.notification.request();
}

void createNotificationChannel() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'alarm_channel', // Same as in your NotificationDetails
    'Alarm Notifications',
    description: 'Channel for alarm notifications',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('alarm'), // Ensure this matches
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}