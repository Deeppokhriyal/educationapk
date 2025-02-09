import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OTPController extends GetxController {
  var isCodeExpired = false.obs;
  var otp = ''.obs;
  var remainingTime = 60.obs; // 1 minute in seconds
  Timer? timer;
  TextEditingController otpController = TextEditingController();

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        isCodeExpired.value = true;
        timer.cancel();
      }
    });
  }

  void resendCode() {
    remainingTime.value = 60; // Reset timer to 60 seconds
    isCodeExpired.value = false;
    otp.value = ''; // Clear the OTP field in the controller
    otpController.clear(); // Clear the text fields in PinCodeTextField
    startTimer(); // Restart the timer
    update(); // Notify UI to update
  }

  void onOTPComplete(String value) {
    otp.value = value;
  }

  @override
  void onClose() {
    timer?.cancel();
    otpController.dispose(); // Dispose of the controller
    super.onClose();
  }
}