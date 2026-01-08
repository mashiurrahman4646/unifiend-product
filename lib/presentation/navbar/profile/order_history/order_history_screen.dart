import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

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
        title: const Text(
          'My Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Order #1245 - Preparing
          _buildOrderCard(
            title: 'Order #1245',
            status: 'Preparing',
            date: '10/02/2026',
            time: '10: 10 AM',
            items: 'Organic Red Tomatoes 2 lb',
            bgColor: const Color(0xFFE8EAF6), // Light Blueish/Purple tint
            statusColor: const Color(0xFF2E7D32), // Dark Green
            statusBgColor: const Color(0xFF2E7D32), // Filled green as per design
            statusTextColor: Colors.white,
            iconAsset: 'assets/icons/giftbox.png', // Reusing gift icon as per other screens
            showReorder: false,
          ),
          const SizedBox(height: 16),
          // Special Offer! - Delivered
          _buildOrderCard(
            title: 'Special Offer!',
            status: 'Delivered',
            date: '10/02/2026',
            time: '10: 10 AM',
            items: 'Organic Red Tomatoes lb',
            price: 10.00,
            bgColor: const Color(0xFFFFFDE7), // Light Yellowish
            statusColor: const Color(0xFFB9F6CA), // Light Green
            statusBgColor: const Color(0xFFB9F6CA),
            statusTextColor: const Color(0xFF1B5E20),
            iconAsset: 'assets/icons/giftbox.png',
            showReorder: true,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String title,
    required String status,
    required String date,
    required String time,
    required String items,
    double? price,
    required Color bgColor,
    required Color statusColor,
    required Color statusBgColor,
    required Color statusTextColor,
    required String iconAsset,
    required bool showReorder,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor, // Background color varies
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(iconAsset, fit: BoxFit.contain), 
                ),
                const SizedBox(width: 16),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusBgColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: statusTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Date: $date  |  Time: $time',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        items,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue, // Items seem blueish in design
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showReorder) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${price?.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004D40), // Dark Green price
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Color(0xFFB9F6CA)), // Light green border
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Reorder',
                      style: TextStyle(
                        color: Color(0xFF66BB6A), // Light green text matching button border
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
