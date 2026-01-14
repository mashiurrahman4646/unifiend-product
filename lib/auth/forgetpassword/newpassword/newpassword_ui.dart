import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/approute.dart';
import '../../../utils/responsive_helper.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return SafeArea(
            child: SingleChildScrollView(
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
                    "Create New Password",
                    style: TextStyle(
                      fontSize: responsive.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(10.0, 15.0)),

                  // Subtitle
                  Text(
                    "Your new password must be different from previous passwords.",
                    style: TextStyle(
                      fontSize: responsive.bodyFontSize,
                      color: const Color(0xFF26292A),
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: responsive.adaptiveSize(40.0, 60.0)),

                  // New Password label
                  Text(
                    "New Password",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: responsive.bodyFontSize),
                  ),

                  SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),

                  // New Password field
                  TextField(
                    obscureText: _obscureNewPassword,
                    style: TextStyle(fontSize: responsive.bodyFontSize),
                    decoration: InputDecoration(
                      hintText: "enter your password",
                      prefixIcon: Icon(Icons.lock_outline, size: responsive.adaptiveSize(20.0, 24.0)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                          size: responsive.adaptiveSize(20.0, 24.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureNewPassword = !_obscureNewPassword;
                          });
                        },
                      ),
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

                  SizedBox(height: responsive.adaptiveSize(20.0, 30.0)),

                  // Confirm Password label
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: responsive.bodyFontSize),
                  ),

                  SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),

                  // Confirm Password field
                  TextField(
                    obscureText: _obscureConfirmPassword,
                    style: TextStyle(fontSize: responsive.bodyFontSize),
                    decoration: InputDecoration(
                      hintText: "enter your password",
                      prefixIcon: Icon(Icons.lock_outline, size: responsive.adaptiveSize(20.0, 24.0)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          size: responsive.adaptiveSize(20.0, 24.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
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

                  // Confirm button
                  SizedBox(
                    width: double.infinity,
                    height: responsive.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Confirm",
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
