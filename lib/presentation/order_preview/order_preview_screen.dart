import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive_helper.dart';
import '../checkout/checkout_screen.dart';

class OrderPreviewScreen extends StatefulWidget {
  final String name;
  final String imagePath;
  final double price;
  final String unit;
  final int initialQuantity;

  const OrderPreviewScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.unit,
    required this.initialQuantity,
  });

  @override
  State<OrderPreviewScreen> createState() => _OrderPreviewScreenState();
}

class _OrderPreviewScreenState extends State<OrderPreviewScreen> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return Padding(
            padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 24.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: responsive.adaptiveSize(250.0, 350.0),
                    width: double.infinity,
                    color: const Color(0xFFF2F2F2),
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(24.0, 32.0)),

                // Product Name
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: responsive.adaptiveSize(22.0, 28.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),

                // Price Breakdown
                Row(
                  children: [
                    Text(
                      '\$ ${widget.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(18.0, 22.0),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1B5E37),
                      ),
                    ),
                    Text(
                      ' ${widget.unit}',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(14.0, 16.0),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                // Mock Discount / Original Price
                Row(
                  children: [
                    Text(
                      '\$ 3.50',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(16.0, 18.0),
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: responsive.adaptiveSize(16.0, 20.0)),
                    Text(
                      '-\$ 1.50',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(16.0, 18.0),
                        color: Colors.green[300],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsive.adaptiveSize(32.0, 48.0)),

                // Quantity Selector
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(18.0, 20.0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: responsive.adaptiveSize(16.0, 20.0)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(4),
                            width: responsive.adaptiveSize(30.0, 40.0),
                            height: responsive.adaptiveSize(30.0, 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: Icon(Icons.remove,
                                  size: responsive.adaptiveSize(16.0, 20.0), color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '$quantity',
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(16.0, 18.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(4),
                            width: responsive.adaptiveSize(30.0, 40.0),
                            height: responsive.adaptiveSize(30.0, 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: Icon(Icons.add,
                                  size: responsive.adaptiveSize(16.0, 20.0), color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: responsive.adaptiveSize(12.0, 16.0)),
                    Text(
                      widget.unit.replaceAll('/', ''),
                      style: TextStyle(
                          fontSize: responsive.adaptiveSize(16.0, 18.0),
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                const Spacer(),

                // Buy Now Button
                SizedBox(
                  width: double.infinity,
                  height: responsive.adaptiveSize(50.0, 60.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => CheckoutScreen(
                            name: widget.name,
                            imagePath: widget.imagePath,
                            price: widget.price,
                            unit: widget.unit,
                            quantity: quantity,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B5E37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(18.0, 20.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
              ],
            ),
          );
        },
      ),
    );
  }
}
