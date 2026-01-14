import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/navbar_controller.dart';
import 'home/home_screen.dart';
import 'cart/cart_screen.dart';
import 'notification/notification_screen.dart';
import 'profile/profile_screen.dart';
import '../../utils/responsive_helper.dart';

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

    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = ResponsiveHelper(context, constraints);
        final iconSize = responsive.adaptiveSize(24.0, 30.0);

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
              selectedFontSize: responsive.adaptiveSize(12.0, 14.0),
              unselectedFontSize: responsive.adaptiveSize(12.0, 14.0),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home_icon.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.grey,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/home_icon.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.green,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/cart.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.grey,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/cart.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.green,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/notification.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.grey,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/notification.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.green,
                  ),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/profile.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.grey,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/profile.png',
                    width: iconSize,
                    height: iconSize,
                    color: Colors.green,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
