import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../route/approute.dart';
import '../../utils/responsive_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.horizontalPadding),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: responsive.adaptiveSize(60.0, 80.0)),
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: responsive.titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: responsive.adaptiveSize(10.0, 16.0)),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Login with your credentials to access your account and manage everything from one place.",
                            style: TextStyle(
                              fontSize: responsive.subtitleFontSize,
                              color: const Color(0xFF26292A),
                              height: 1.43,
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.adaptiveSize(40.0, 60.0)),
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: responsive.bodyFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "jhon@gmail.com",
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.green, width: 1.5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: responsive.bodyFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "enter your password",
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.green, width: 1.5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.forgetPassword);
                            },
                            child: const Text(
                              "Forget password?",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.adaptiveSize(20.0, 32.0)),
                        SizedBox(
                          width: double.infinity,
                          height: responsive.buttonHeight,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed(AppRoutes.mainNavbar);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(16.0, 18.0),
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.adaptiveSize(25.0, 32.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(fontSize: responsive.bodyFontSize),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.register);
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: responsive.bodyFontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: responsive.adaptiveSize(30.0, 40.0)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
