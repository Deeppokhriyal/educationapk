// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreferencesController {
//   static late SharedPreferences _preferences;
//
//   // Initialize SharedPreferences
//   static Future<void> init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   // Save user credentials
//   static Future<void> saveUser Credentials(String username, String password) async {
//     await _preferences.setString('username', username);
//     await _preferences.setString('password', password);
//   }
//
//   // Get username
//   static String? getUsername() {
//     return _preferences.getString('username');
//   }
//
//   // Get password
//   static String? getPassword() {
//     return _preferences.getString('password');
//   }
//
//   // Clear user credentials
//   static Future<void> clearUser Credentials() async {
//     await _preferences.remove('username');
//     await _preferences.remove('password');
//   }
// }