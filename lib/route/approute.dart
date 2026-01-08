// File: lib/app_routes.dart (or wherever AppRoutes is defined)
import 'package:get/get.dart';

// Screens
import '../auth/create_new_account/create_new_account_ui.dart';
import '../auth/forgetpassword/newpassword/newpassword_ui.dart';
import '../auth/forgetpassword/otp/otp_ui.dart';
import '../auth/forgetpassword/submitemail/submitemail_ui.dart';
import '../splash_screen/splash_screen.dart';
import '../auth/login/loginui.dart';
import '../presentation/navbar/main_navbar.dart';
// New screen path for Sign Up

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String verifyOtp = '/verifyOtp';
  static const String createNewPassword = '/createNewPassword';
  static const String register = '/register'; // Route for Sign Up
  static const String home = '/home';
  static const String mainNavbar = '/mainNavbar';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: verifyOtp,
      page: () => const VerifyOtpScreen(),
    ),
    GetPage(
      name: createNewPassword,
      page: () => const CreateNewPasswordScreen(),
    ),
    GetPage(
      name: register,
      page: () => const SignUpScreen(), // Add the new Sign Up screen
    ),
    GetPage(
      name: mainNavbar,
      page: () => const MainNavbar(),
    ),
  ];
}