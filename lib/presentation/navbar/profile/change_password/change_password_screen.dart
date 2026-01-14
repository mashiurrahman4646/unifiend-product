import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/responsive_helper.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Visibility states for each field
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Padding(
              padding: EdgeInsets.only(left: responsive.adaptiveSize(16.0, 24.0)),
              child: Center(
                child: Container(
                  width: responsive.adaptiveSize(40.0, 50.0),
                  height: responsive.adaptiveSize(40.0, 50.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: responsive.adaptiveSize(18.0, 22.0), color: Colors.black),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return SingleChildScrollView(
            padding: EdgeInsets.all(responsive.adaptiveSize(20.0, 32.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Current Password
                Text(
                  'Current Password',
                  style: TextStyle(
                    fontSize: responsive.adaptiveSize(16.0, 20.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(12.0, 20.0)),
                _buildPasswordField(
                  responsive,
                  hint: 'enter your password',
                  obscureText: _obscureCurrent,
                  onToggleVisibility: () {
                    setState(() {
                      _obscureCurrent = !_obscureCurrent;
                    });
                  },
                ),
                SizedBox(height: responsive.adaptiveSize(24.0, 32.0)),

                // New Password
                Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: responsive.adaptiveSize(16.0, 20.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(12.0, 20.0)),
                _buildPasswordField(
                  responsive,
                  hint: 'enter your password',
                  obscureText: _obscureNew,
                  onToggleVisibility: () {
                    setState(() {
                      _obscureNew = !_obscureNew;
                    });
                  },
                ),
                SizedBox(height: responsive.adaptiveSize(24.0, 32.0)),

                // Confirm New Password
                Text(
                  'Confirm New Password',
                  style: TextStyle(
                    fontSize: responsive.adaptiveSize(16.0, 20.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(12.0, 20.0)),
                _buildPasswordField(
                  responsive,
                  hint: 'enter your password',
                  obscureText: _obscureConfirm,
                  onToggleVisibility: () {
                    setState(() {
                      _obscureConfirm = !_obscureConfirm;
                    });
                  },
                ),

                SizedBox(height: responsive.adaptiveSize(40.0, 60.0)),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: responsive.adaptiveSize(50.0, 60.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004D40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(16.0, 20.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPasswordField(
    ResponsiveHelper responsive, {
    required String hint,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: Colors.grey.shade400, fontSize: responsive.adaptiveSize(14.0, 16.0)),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.symmetric(
            horizontal: responsive.adaptiveSize(16.0, 20.0),
            vertical: responsive.adaptiveSize(14.0, 18.0)),
        prefixIcon: Icon(Icons.lock_outline,
            color: Colors.grey.shade400, size: responsive.adaptiveSize(20.0, 24.0)),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.grey.shade400,
            size: responsive.adaptiveSize(20.0, 24.0),
          ),
          onPressed: onToggleVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
