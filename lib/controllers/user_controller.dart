import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Observable variables
  var userName = "".obs;
  var userProfileImage = "".obs;
  var userBio = "".obs;
  var userBranch = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
      await firestore.collection("users").doc(user.uid).get();
      if (userData.exists) {
        userName.value = userData["name"];
        userProfileImage.value = userData["profileImage"];
        // userBio.value = userData["bio"];
        userBranch.value = userData["branch"];
      }
    }
  }
}
