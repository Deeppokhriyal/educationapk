import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:animate_do/animate_do.dart';
import 'package:educationapk/before%20start/login.dart';
import 'package:educationapk/bottombar/homepage.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'bottombar/application.dart';
import 'bottombar/profilepage.dart';
import 'bottombar/schedulerstart.dart';

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
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1200), () {
      Get.off(() => MyLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeIn(
          duration: const Duration(milliseconds: 600),
          child: Image.asset("assets/images/logo.png"),
        ),
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

