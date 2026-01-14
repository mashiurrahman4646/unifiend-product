import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/approute.dart';
import '../../../utils/responsive_helper.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: responsive.adaptiveSize(10.0, 20.0)),
                  // Back button
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new, size: responsive.adaptiveSize(24.0, 30.0)),
                  ),

                  SizedBox(height: responsive.adaptiveSize(20.0, 30.0)),

                  // Title
                  Text(
                    "Check your Email",
                    style: TextStyle(
                      fontSize: responsive.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(10.0, 15.0)),

                  // Subtitle
                  Text(
                    "We send verification code. Please check your email.",
                    style: TextStyle(
                      fontSize: responsive.bodyFontSize,
                      color: const Color(0xFF26292A),
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(40.0, 60.0)),

                  // OTP label
                  Text(
                    "OTP",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: responsive.bodyFontSize),
                  ),

                  SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),

                  // OTP field
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    style: TextStyle(fontSize: responsive.bodyFontSize),
                    decoration: InputDecoration(
                      hintText: "Enter 6-digit code",
                      prefixIcon: Icon(Icons.lock_outline, size: responsive.adaptiveSize(20.0, 24.0)),
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
                      contentPadding: EdgeInsets.all(responsive.adaptiveSize(16.0, 20.0)),
                      counterText: '', // Hide counter
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(30.0, 45.0)),

                  // Send button
                  SizedBox(
                    width: double.infinity,
                    height: responsive.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Validate OTP and make API call to verify
                        // On success, navigate to create new password screen
                        Get.toNamed(AppRoutes.createNewPassword);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(16.0, 18.0),
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
