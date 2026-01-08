import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/navbar_controller.dart';
import 'home/home_screen.dart';
import 'cart/cart_screen.dart';
import 'notification/notification_screen.dart';
import 'profile/profile_screen.dart';

class MainNavbar extends StatelessWidget {
  const MainNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    final List<Widget> screens = [
      const HomeScreen(),
      const CartScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home_icon.png',
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
              activeIcon: Image.asset(
                'assets/icons/home_icon.png',
                width: 24,
                height: 24,
                color: Colors.green,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/cart.png',
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
              activeIcon: Image.asset(
                'assets/icons/cart.png',
                width: 24,
                height: 24,
                color: Colors.green,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/notification.png',
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
              activeIcon: Image.asset(
                'assets/icons/notification.png',
                width: 24,
                height: 24,
                color: Colors.green,
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/profile.png',
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
              activeIcon: Image.asset(
                'assets/icons/profile.png',
                width: 24,
                height: 24,
                color: Colors.green,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
