import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../route/approute.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  // Controllers without pre-filling to show hints properly
  final emailController = TextEditingController(); // Empty, so hint shows
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Dynamic sizing based on available width
            final screenWidth = constraints.maxWidth;
            final horizontalPadding = screenWidth > 600 ? 40.0 : screenWidth * 0.05; // Larger padding on tablets/desktop
            final subtitleWidth = screenWidth - (2 * horizontalPadding); // Full width minus padding

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: screenWidth > 600 ? 80.0 : 60.0), // Taller top spacing on larger screens
                        // Title - Scale font size slightly for larger screens
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 32.0 : 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenWidth > 600 ? 16.0 : 10.0),
                        // Subtitle - Dynamic width, responsive font
                        SizedBox(
                          width: subtitleWidth,
                          child: const Text(
                            "Login with your credentials to access your account and manage everything from one place.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF26292A), // Exact Figma color
                              height: 1.43, // Line height ~20px for fontSize 14
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth > 600 ? 60.0 : 40.0),
                        // Email
                        Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "jhon@gmail.com", // Now acts as true hint
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
                        SizedBox(height: 20),
                        // Password
                        Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
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
                        // Forget Password
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
                        SizedBox(height: screenWidth > 600 ? 32.0 : 20.0),
                        // Sign In Button - Full width, responsive height
                        SizedBox(
                          width: double.infinity,
                          height: screenWidth > 600 ? 60.0 : 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Add your sign-in logic here (validation, API call, etc.)
                              // On success, navigate to home
                              Get.offAllNamed(AppRoutes.mainNavbar);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0, // Flat look to match Figma
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: screenWidth > 600 ? 18.0 : 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth > 600 ? 32.0 : 25.0),
                        // Sign Up - Centered, responsive font
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(fontSize: screenWidth > 600 ? 16.0 : 14.0),
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
                                  fontSize: screenWidth > 600 ? 16.0 : 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenWidth > 600 ? 40.0 : 30.0),
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