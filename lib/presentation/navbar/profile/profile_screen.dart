import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/responsive_helper.dart';

import 'change_name/change_name_screen.dart';
import 'change_password/change_password_screen.dart';
import 'my_favorites/my_favorites_screen.dart';
import 'order_history/order_history_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Ensure no back button
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: responsive.horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: responsive.adaptiveSize(20.0, 30.0)),
                // Profile Image Section
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: responsive.adaptiveSize(100.0, 150.0),
                        height: responsive.adaptiveSize(100.0, 150.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/zora.png'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(responsive.adaptiveSize(6.0, 8.0)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCE4EC),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(Icons.photo_camera_outlined,
                              size: responsive.adaptiveSize(16.0, 20.0), color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                // Name and Email
                Text(
                  'Jhon Doe',
                  style: TextStyle(
                    fontSize: responsive.adaptiveSize(18.0, 24.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: responsive.adaptiveSize(16.0, 20.0),
                      vertical: responsive.adaptiveSize(8.0, 10.0)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    'jhon@gmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: responsive.adaptiveSize(14.0, 16.0),
                    ),
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(32.0, 48.0)),
                // User Information Header
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'User Informetion',
                    style: TextStyle(
                      fontSize: responsive.adaptiveSize(16.0, 20.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                // Menu Items
                _buildMenuItem(
                  responsive,
                  icon: Icons.person_outline,
                  iconBgColor: const Color(0xFFE3F2FD), // Light Blue
                  iconColor: Colors.blue,
                  title: 'change name ',
                  onTap: () => Get.to(() => const ChangeNameScreen()),
                ),
                SizedBox(height: responsive.adaptiveSize(12.0, 16.0)),
                _buildMenuItem(
                  responsive,
                  icon: Icons.lock_outline,
                  iconBgColor: const Color(0xFFE8F5E9), // Light Green
                  iconColor: Colors.green,
                  title: 'Change Password',
                  onTap: () => Get.to(() => const ChangePasswordScreen()),
                ),
                SizedBox(height: responsive.adaptiveSize(12.0, 16.0)),
                _buildMenuItem(
                  responsive,
                  icon: Icons.history, // Or swap_vert/list
                  iconBgColor: const Color(0xFFE3F2FD), // Light Blue
                  iconColor: Colors.blue,
                  title: 'Order History',
                  onTap: () => Get.to(() => const OrderHistoryScreen()),
                ),
                SizedBox(height: responsive.adaptiveSize(12.0, 16.0)),
                _buildMenuItem(
                  responsive,
                  icon: Icons.favorite_border,
                  iconBgColor: const Color(0xFFFFEBEE), // Light Red
                  iconColor: Colors.red,
                  title: 'My Favorites',
                  onTap: () => Get.to(() => const MyFavoritesScreen()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuItem(
    ResponsiveHelper responsive, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
            horizontal: responsive.adaptiveSize(16.0, 20.0), vertical: responsive.adaptiveSize(4.0, 6.0)),
        leading: Container(
          padding: EdgeInsets.all(responsive.adaptiveSize(8.0, 10.0)),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: responsive.adaptiveSize(20.0, 24.0)),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: responsive.adaptiveSize(14.0, 16.0),
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: responsive.adaptiveSize(16.0, 18.0), color: Colors.grey),
      ),
    );
  }
}
