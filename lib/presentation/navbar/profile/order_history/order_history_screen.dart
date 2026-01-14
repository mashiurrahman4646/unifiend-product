import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/responsive_helper.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Padding(
              padding: EdgeInsets.only(left: responsive.adaptiveSize(16.0, 24.0)),
              child: Center(
                child: Container(
                  width: responsive.adaptiveSize(40.0, 50.0),
                  height: responsive.adaptiveSize(40.0, 50.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: responsive.adaptiveSize(18.0, 22.0), color: Colors.black),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            );
          },
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Text(
              'My Orders',
              style: TextStyle(
                color: Colors.black,
                fontSize: responsive.adaptiveSize(18.0, 22.0),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return ListView(
            padding: EdgeInsets.all(responsive.adaptiveSize(20.0, 32.0)),
            children: [
              // Order #1245 - Preparing
              _buildOrderCard(
                responsive,
                title: 'Order #1245',
                status: 'Preparing',
                date: '10/02/2026',
                time: '10: 10 AM',
                items: 'Organic Red Tomatoes 2 lb',
                bgColor: const Color(0xFFE8EAF6),
                statusColor: const Color(0xFF2E7D32),
                statusBgColor: const Color(0xFF2E7D32),
                statusTextColor: Colors.white,
                iconAsset: 'assets/icons/giftbox.png',
                showReorder: false,
              ),
              SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
              // Special Offer! - Delivered
              _buildOrderCard(
                responsive,
                title: 'Special Offer!',
                status: 'Delivered',
                date: '10/02/2026',
                time: '10: 10 AM',
                items: 'Organic Red Tomatoes lb',
                price: 10.00,
                bgColor: const Color(0xFFFFFDE7),
                statusColor: const Color(0xFFB9F6CA),
                statusBgColor: const Color(0xFFB9F6CA),
                statusTextColor: const Color(0xFF1B5E20),
                iconAsset: 'assets/icons/giftbox.png',
                showReorder: true,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOrderCard(
    ResponsiveHelper responsive, {
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
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 20.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: responsive.adaptiveSize(48.0, 60.0),
                  height: responsive.adaptiveSize(48.0, 60.0),
                  padding: EdgeInsets.all(responsive.adaptiveSize(10.0, 12.0)),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(iconAsset, fit: BoxFit.contain),
                ),
                SizedBox(width: responsive.adaptiveSize(16.0, 20.0)),
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
                            style: TextStyle(
                              fontSize: responsive.adaptiveSize(16.0, 18.0),
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsive.adaptiveSize(12.0, 16.0),
                                vertical: responsive.adaptiveSize(4.0, 6.0)),
                            decoration: BoxDecoration(
                              color: statusBgColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: statusTextColor,
                                fontSize: responsive.adaptiveSize(12.0, 14.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                      Text(
                        'Date: $date  |  Time: $time',
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(12.0, 14.0),
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                      SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                      Text(
                        items,
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(14.0, 16.0),
                          color: Colors.blue,
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
              padding: EdgeInsets.symmetric(
                  horizontal: responsive.adaptiveSize(16.0, 20.0),
                  vertical: responsive.adaptiveSize(12.0, 16.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${price?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: responsive.adaptiveSize(16.0, 18.0),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF004D40),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsive.adaptiveSize(20.0, 24.0),
                          vertical: responsive.adaptiveSize(8.0, 10.0)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Color(0xFFB9F6CA)),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Reorder',
                      style: TextStyle(
                        color: const Color(0xFF66BB6A),
                        fontWeight: FontWeight.bold,
                        fontSize: responsive.adaptiveSize(14.0, 16.0),
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
