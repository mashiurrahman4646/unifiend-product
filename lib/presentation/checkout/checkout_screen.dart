import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import 'add_shipping_address_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final double price;
  final String unit;
  final int quantity;

  const CheckoutScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.unit,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    double subtotal = price * quantity;
    double shipping = 5.00;
    double total = subtotal + shipping;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: Colors.black, size: responsive.adaptiveSize(20.0, 24.0)),
              onPressed: () => Navigator.pop(context),
            );
          },
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Text(
              'Checkout',
              style: TextStyle(
                color: Colors.black,
                fontSize: responsive.adaptiveSize(20.0, 24.0),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 24.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Card
                      Container(
                        padding: EdgeInsets.all(responsive.adaptiveSize(12.0, 16.0)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: responsive.adaptiveSize(150.0, 220.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(18.0, 22.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                            Row(
                              children: [
                                Text(
                                  '\$ ${price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: responsive.adaptiveSize(16.0, 20.0),
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1B5E37),
                                  ),
                                ),
                                Text(
                                  unit,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: responsive.adaptiveSize(14.0, 16.0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                            Row(
                              children: [
                                Text('Quantity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: responsive.adaptiveSize(14.0, 16.0))),
                                SizedBox(width: responsive.adaptiveSize(16.0, 20.0)),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: responsive.adaptiveSize(12.0, 16.0),
                                      vertical: responsive.adaptiveSize(6.0, 8.0)),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(quantity.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive.adaptiveSize(14.0, 16.0))),
                                ),
                                SizedBox(width: responsive.adaptiveSize(8.0, 12.0)),
                                Text(
                                  unit.replaceAll('/', ''),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: responsive.adaptiveSize(14.0, 16.0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsive.adaptiveSize(24.0, 32.0)),

                      // Delivery Option placeholder
                      Text(
                        'Delivery or pickup',
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(16.0, 18.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                      Container(
                        padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 20.0)),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Standard Delivery',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: responsive.adaptiveSize(14.0, 16.0))),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.local_shipping,
                                        size: responsive.adaptiveSize(16.0, 18.0),
                                        color: Colors.green),
                                    const SizedBox(width: 4),
                                    Text('Guaranteed by 10-13 Jan',
                                        style: TextStyle(
                                            fontSize: responsive.adaptiveSize(12.0, 14.0),
                                            color: Colors.teal)),
                                  ],
                                )
                              ],
                            ),
                            Text('\$5.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: responsive.adaptiveSize(14.0, 16.0),
                                    color: const Color(0xFF1B5E37))),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Order Summary Bottom Sheet
                      Container(
                        padding: EdgeInsets.symmetric(vertical: responsive.adaptiveSize(16.0, 24.0)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Merchandise Subtotal ($quantity kg/unit)',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: responsive.adaptiveSize(14.0, 16.0))),
                                Text('\$${subtotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: responsive.adaptiveSize(14.0, 16.0),
                                        color: const Color(0xFF1B5E37))),
                              ],
                            ),
                            SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Shipping Subtotal',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: responsive.adaptiveSize(14.0, 16.0))),
                                Text('\$${shipping.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: responsive.adaptiveSize(14.0, 16.0),
                                        color: const Color(0xFF1B5E37))),
                              ],
                            ),
                            Divider(height: responsive.adaptiveSize(24.0, 32.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total :',
                                    style: TextStyle(
                                        fontSize: responsive.adaptiveSize(16.0, 18.0),
                                        fontWeight: FontWeight.bold)),
                                Text('\$${total.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontSize: responsive.adaptiveSize(18.0, 22.0),
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1B5E37))),
                              ],
                            ),
                            SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                            SizedBox(
                              width: double.infinity,
                              height: responsive.adaptiveSize(50.0, 60.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => const AddShippingAddressScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1B5E37),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Proceed To Pay',
                                  style: TextStyle(
                                    fontSize: responsive.adaptiveSize(18.0, 20.0),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
