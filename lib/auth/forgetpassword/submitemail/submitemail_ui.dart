import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/approute.dart';
import '../../../utils/responsive_helper.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: responsive.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(10.0, 15.0)),

                  // Subtitle
                  Text(
                    "Enter the email or phone your account and we’ll send a code to reset your password.",
                    style: TextStyle(
                      fontSize: responsive.bodyFontSize,
                      color: const Color(0xFF26292A),
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(40.0, 60.0)),

                  // Email label
                  Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: responsive.bodyFontSize),
                  ),

                  SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),

                  // Email field
                  TextField(
                    style: TextStyle(fontSize: responsive.bodyFontSize),
                    decoration: InputDecoration(
                      hintText: "jhon@gmail.com",
                      prefixIcon: Icon(Icons.email_outlined, size: responsive.adaptiveSize(20.0, 24.0)),
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
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(30.0, 45.0)),

                  // Send button
                  SizedBox(
                    width: double.infinity,
                    height: responsive.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Validate email and make API call for send reset code
                        // For now, navigate to OTP page assuming email is valid
                        Get.toNamed(AppRoutes.verifyOtp);
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
