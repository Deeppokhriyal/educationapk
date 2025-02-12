import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatelessWidget {

  OtpVerificationPage({Key? key}) : super(key: key);

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
            // Logo or Image
            Image.network('https://cdn-icons-png.flaticon.com/128/11682/11682572.png',
              height: 115.0,
              width: 110.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              'OTP Verification',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Message
            Text(
              'We have sent an OTP to your registered number.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Countdown Timer
            Text(
              "00:30", // Placeholder for countdown timer
              style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            // PIN Code Input Field
            PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: (value) {
                // No logic here, just UI
              },
              autoDismissKeyboard: true,
              enablePinAutofill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(15),
                fieldHeight: 75,
                fieldWidth: 75,
                activeColor: Colors.blue,
                activeFillColor: Colors.lightBlueAccent,
                selectedColor: Colors.blue,
                selectedFillColor: Colors.blue[100],
                inactiveColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Resend Code Button
            ElevatedButton(
              onPressed: () {
                // No logic here, just UI
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Resend Code",
                style: GoogleFonts.poppins(
                  color: Colors.white,
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