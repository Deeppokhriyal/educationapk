import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Initialize FCM and Get Token
  static Future<void> initializeFCM() async {
    // Request Notification Permission
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // FCM Token Retrieval
    String? token = await messaging.getToken();
    print("FCM Token: $token");

    if (token != null) {
      await saveTokenToDatabase(token);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground Notification Received: ${message.notification?.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notification Clicked: ${message.notification?.title}");
    });
  }

  // Store Token in Firestore
  static Future<void> saveTokenToDatabase(String token) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'fcmToken': token,
    });

    print("FCM Token Saved to Firestore");
  }

  Future<void> saveFcmTokenForTeacher(String teacherId) async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    if (fcmToken != null) {
      await FirebaseFirestore.instance.collection('users')
          .doc(teacherId)
          .update({
        'fcmToken': fcmToken,
      });
    }
  }
}
