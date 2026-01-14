import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../route/approute.dart';
import '../utils/responsive_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.login);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return Center(
            child: Image.asset(
              'assets/images/splashscreen.png',
              width: responsive.adaptiveSize(220.0, 350.0),
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
