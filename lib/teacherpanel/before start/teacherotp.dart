import 'package:educationapk/before%20start/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';

class OtpVerificationPage extends StatefulWidget {
  final String email;  // Email to pass

  OtpVerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int _remainingTime = 30;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    sendOtp();  // Send OTP when page loads
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // 🔄 Start Countdown Timer
  void startTimer() {
    setState(() {
      _isResendEnabled = false;
      _remainingTime = 30;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        setState(() {
          _isResendEnabled = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  // ✉️ Send OTP via Email
  Future<void> sendOtp() async {
    String otp = (Random().nextInt(9000) + 1000).toString();
    try {
      // Save OTP to Firestore
      await FirebaseFirestore.instance.collection('emailOtps').doc(widget.email).set({
        'otp': otp,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // print("OTP sent to ${widget.email}: $otp");
    } catch (e) {
      // print("Failed to send OTP: $e");
    }
  }

  // ✅ Verify OTP
  // ✅ Verify OTP
  Future<void> verifyOtp() async {
    String enteredOtp = otpController.text.trim();
    if (enteredOtp.isEmpty || enteredOtp.length != 4) {
      // print("Invalid OTP");
      return;
    }

    try {
      // Get OTP from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('emailOtps').doc(widget.email).get();
      if (snapshot.exists && snapshot['otp'] == enteredOtp) {
        // print("OTP Verified Successfully!");

        // ✅ OTP verify hone ke baad LoginPage par le jaaye
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyLogin()),
        );

      } else {
        // print("Invalid OTP!");
      }
    } catch (e) {
      // print("Error verifying OTP: $e");
    }
  }


  // 🔄 Resend OTP
  Future<void> resendOtp() async {
    if (!_isResendEnabled) return;
    await sendOtp();  // Send a new OTP
    startTimer();  // Restart timer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/128/11682/11682572.png',
              height: 115.0,
              width: 110.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'OTP Verification',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We have sent an OTP to your registered email.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isResendEnabled ? "00:00" : "00:${_remainingTime.toString().padLeft(2, '0')}",
              style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              controller: otpController,
              length: 4,
              onChanged: (value) {},
              autoDismissKeyboard: true,
              enablePinAutofill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(15),
                fieldHeight: 60,
                fieldWidth: 50,
                activeColor: Colors.blue,
                activeFillColor: Colors.lightBlueAccent,
                selectedColor: Colors.blue,
                selectedFillColor: Colors.blue[100],
                inactiveColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Verify OTP",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _isResendEnabled ? resendOtp : null,
              child: Text(
                "Resend Code",
                style: GoogleFonts.poppins(
                  color: _isResendEnabled ? Colors.blue : Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
