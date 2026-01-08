import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Image Section
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/zora.png'), // Using zora.png as placeholder from file list
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
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCE4EC), // Light pinkish/reddish background
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(Icons.photo_camera_outlined, size: 16, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Name and Email
            const Text(
              'Jhon Doe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                'jhon@gmail.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // User Information Header
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'User Informetion', // Keeping "Informetion" as per design request/image
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Menu Items
            _buildMenuItem(
              icon: Icons.person_outline,
              iconBgColor: const Color(0xFFE3F2FD), // Light Blue
              iconColor: Colors.blue,
              title: 'change name ',
              onTap: () => Get.to(() => const ChangeNameScreen()),
            ),
            const SizedBox(height: 12),
            _buildMenuItem(
              icon: Icons.lock_outline,
              iconBgColor: const Color(0xFFE8F5E9), // Light Green
              iconColor: Colors.green,
              title: 'Change Password',
              onTap: () => Get.to(() => const ChangePasswordScreen()),
            ),
            const SizedBox(height: 12),
            _buildMenuItem(
              icon: Icons.history, // Or swap_vert/list
              iconBgColor: const Color(0xFFE3F2FD), // Light Blue
              iconColor: Colors.blue,
              title: 'Order History',
              onTap: () => Get.to(() => const OrderHistoryScreen()),
            ),
            const SizedBox(height: 12),
            _buildMenuItem(
              icon: Icons.favorite_border,
              iconBgColor: const Color(0xFFFFEBEE), // Light Red
              iconColor: Colors.red,
              title: 'My Favorites',
              onTap: () => Get.to(() => const MyFavoritesScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
