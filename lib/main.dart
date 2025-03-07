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
import 'bottombar/application.dart';
import 'bottombar/profilepage.dart';
import 'bottombar/schedulerstart.dart';
import 'controllers/user_controller.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AndroidAlarmManager.initialize();

  var androidInitialize =
  const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
  InitializationSettings(android: androidInitialize);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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

  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen((User? user) {
      checkLoginStatus();
    });
  }

  void checkLoginStatus() async {
    bool navigated = false;

    Future.delayed(Duration(seconds: 10), () {
      if (!navigated && mounted) {
        Get.off(() => MyLogin());
      }
    });

    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        String role = userData['role'];
        navigated = true;

        if (role == "teacher") {
          Get.off(() => Teacherbar());
        } else if (role == "student") {
          Get.off(() => Bottombar());
        } else {
          Get.off(() => MyLogin());
        }
      } else {
        navigated = true;
        Get.off(() => MyLogin());
      }
    } else {
      navigated = true;
      Get.off(() => MyLogin());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

void triggerAlarm() async {
  print("\u{1F680} Alarm Triggered!");

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
  print("✅ Alarm scheduled for $alarmTime");
  await AndroidAlarmManager.oneShotAt(
    alarmTime,
    0,
    triggerAlarm,
    exact: true,
    wakeup: true,
  );
}

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MyMainHome(),
    Schedulerstart(),
    LeaveApplication(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.blue,
          tabBackgroundColor: Colors.lightBlueAccent[100]!,
          gap: 5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          onTabChange: _onItemTapped,
          selectedIndex: _selectedIndex,
          tabs: const [
            GButton(icon: Icons.home, iconSize: 25, text: 'Home'),
            GButton(icon: Icons.bar_chart, iconSize: 25, text: 'Features'),
            GButton(icon: Icons.add_chart, iconSize: 25, text: 'Application'),
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

class BeautifulLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue, // Change color as needed
          size: 80.0,
        ),
      ),
    );
  }
}
