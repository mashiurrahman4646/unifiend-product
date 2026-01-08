import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../route/approute.dart';


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
      body: Center(
        child: Image.asset(
          'assets/images/splashscreen.png',
          width: 220,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
