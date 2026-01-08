// File: auth/forgetpassword/verify_otp/verify_otp_ui.dart (Updated)
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/approute.dart';
// Import your routes file

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Check your Email",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle
              const Text(
                "We send verification code. Please check your email.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF26292A),
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 40),

              // OTP label
              const Text(
                "OTP",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 8),

              // OTP field (single field for simplicity; can be extended to 6 separate fields if needed)
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Enter 6-digit code",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  counterText: '', // Hide counter for cleaner look
                ),
              ),

              const SizedBox(height: 30),

              // Send button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Validate OTP and make API call to verify
                    // On success, navigate to create new password screen
                    // For now, navigate to create new password assuming OTP is valid
                    Get.toNamed(AppRoutes.createNewPassword);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Send",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}