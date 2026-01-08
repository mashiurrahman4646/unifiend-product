import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final notifications = [
      {
        'title': 'Special Offer!',
        'description': 'Get 10% off on fresh vegetables today. Order now.',
        'time': '2 m ago',
        'type': 'offer',
        'isUnread': true,
      },
      {
        'title': 'Order Dispatched',
        'description': 'Your order has been dispatched. You will receive it shortly.',
        'time': '10 m ago',
        'type': 'dispatch',
        'isUnread': true,
      },
      // Adding a read notification to test styling if needed, though image shows only unread
    ];

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
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final note = notifications[index];
          final isOffer = note['type'] == 'offer';
          
          Color bgColor;
          Color iconBgColor;
          // IconData icon; // Unused
          
          String iconAsset;
          
          if (isOffer) {
            bgColor = const Color(0xFFFFF9E6); // Light creamy yellow
            iconBgColor = const Color(0xFFFFECC2); // Slightly darker
            iconAsset = 'assets/icons/cart.png';
          } else {
            bgColor = const Color(0xFFEEF6FC); // Light Blueish
            iconBgColor = const Color(0xFFDCEAF6);
            iconAsset = 'assets/icons/giftbox.png';
          }

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8), // Add padding for image
                  decoration: BoxDecoration(
                    color: iconBgColor, // Icon background
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(iconAsset, fit: BoxFit.contain), // Use Image.asset
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            note['title'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          if (note['isUnread'] as bool)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDDA0A0), // Reddish dot
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        note['description'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          note['time'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
