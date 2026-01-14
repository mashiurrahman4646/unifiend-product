import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../checkout/checkout_screen.dart';
import '../../utils/responsive_helper.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final String imagePath;
  final double price;
  final String description;
  final String unit;
  final double rating;
  final int reviews;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.unit,
    required this.rating,
    required this.reviews,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);

            return Column(
              children: [
                // Header with Image
                Expanded(
                  flex: responsive.isTablet ? 5 : 4,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFF2F2F2),
                        child: Image.asset(
                          widget.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: responsive.adaptiveSize(16.0, 24.0),
                        left: responsive.adaptiveSize(16.0, 24.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: responsive.adaptiveSize(20.0, 28.0),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                size: responsive.adaptiveSize(18.0, 22.0),
                                color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      Positioned(
                        top: responsive.adaptiveSize(16.0, 24.0),
                        right: responsive.adaptiveSize(16.0, 24.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent, // Or white if preferred
                          radius: responsive.adaptiveSize(20.0, 28.0),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: responsive.adaptiveSize(24.0, 30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Details
                Expanded(
                  flex: responsive.isTablet ? 5 : 6,
                  child: Container(
                    padding: EdgeInsets.all(responsive.adaptiveSize(24.0, 32.0)),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(24.0, 30.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: responsive.adaptiveSize(8.0, 12.0),
                                  vertical: responsive.adaptiveSize(4.0, 6.0)),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.green,
                                      size: responsive.adaptiveSize(16.0, 20.0)),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.rating.toString(),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: responsive.adaptiveSize(14.0, 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: responsive.adaptiveSize(16.0, 20.0)),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: responsive.adaptiveSize(14.0, 16.0),
                            color: Colors.teal[700],
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: responsive.adaptiveSize(24.0, 32.0)),
                        Row(
                          children: [
                            Text(
                              '\$ ${widget.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(24.0, 30.0),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1B5E37),
                              ),
                            ),
                            Text(
                              ' ${widget.unit}',
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(16.0, 18.0),
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: responsive.adaptiveSize(32.0, 40.0)),

                        // Quantity Selector
                        Row(
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(16.0, 18.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove),
                                    color: Colors.grey,
                                    iconSize: responsive.adaptiveSize(24.0, 28.0),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: responsive.adaptiveSize(12.0, 16.0),
                                        vertical: responsive.adaptiveSize(8.0, 10.0)),
                                    child: Text(
                                      '$quantity',
                                      style: TextStyle(
                                        fontSize: responsive.adaptiveSize(16.0, 18.0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                    color: const Color(0xFF1B5E37),
                                    iconSize: responsive.adaptiveSize(24.0, 28.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.unit.replaceAll('/', ''), // e.g. "Pound" from "/ Pound"
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: responsive.adaptiveSize(14.0, 16.0),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1B5E37),
                                  padding: EdgeInsets.symmetric(
                                      vertical: responsive.adaptiveSize(16.0, 20.0)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                        size: responsive.adaptiveSize(20.0, 24.0)),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          fontSize: responsive.adaptiveSize(16.0, 18.0),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
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
                                  backgroundColor:
                                      const Color(0xFF0E4F4F), // Slightly darker for Buy Now
                                  padding: EdgeInsets.symmetric(
                                      vertical: responsive.adaptiveSize(16.0, 20.0)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_bag_outlined,
                                        color: Colors.white,
                                        size: responsive.adaptiveSize(20.0, 24.0)),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Buy Now',
                                      style: TextStyle(
                                        fontSize: responsive.adaptiveSize(16.0, 18.0),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
