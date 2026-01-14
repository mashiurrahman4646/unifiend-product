import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/responsive_helper.dart';

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
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Ensure no back button
        centerTitle: false,
        title: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Text(
              'Notifications',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.adaptiveSize(18.0, 22.0)),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return ListView.separated(
            padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 24.0)),
            itemCount: notifications.length,
            separatorBuilder: (_, __) => SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
            itemBuilder: (context, index) {
              final note = notifications[index];
              final isOffer = note['type'] == 'offer';

              Color bgColor;
              Color iconBgColor;
              String iconAsset;

              if (isOffer) {
                bgColor = const Color(0xFFFFF9E6);
                iconBgColor = const Color(0xFFFFECC2);
                iconAsset = 'assets/icons/cart.png';
              } else {
                bgColor = const Color(0xFFEEF6FC);
                iconBgColor = const Color(0xFFDCEAF6);
                iconAsset = 'assets/icons/giftbox.png';
              }

              return Container(
                padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 20.0)),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: responsive.adaptiveSize(40.0, 50.0),
                      height: responsive.adaptiveSize(40.0, 50.0),
                      padding: EdgeInsets.all(responsive.adaptiveSize(8.0, 10.0)),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(iconAsset, fit: BoxFit.contain),
                    ),
                    SizedBox(width: responsive.adaptiveSize(16.0, 20.0)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note['title'] as String,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: responsive.adaptiveSize(15.0, 17.0),
                                  color: Colors.black87,
                                ),
                              ),
                              if (note['isUnread'] as bool)
                                Container(
                                  width: responsive.adaptiveSize(8.0, 10.0),
                                  height: responsive.adaptiveSize(8.0, 10.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFDDA0A0),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                          Text(
                            note['description'] as String,
                            style: TextStyle(
                              fontSize: responsive.adaptiveSize(13.0, 15.0),
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              note['time'] as String,
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(12.0, 14.0),
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
          );
        },
      ),
    );
  }
}
