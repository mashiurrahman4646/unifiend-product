import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../checkout/checkout_screen.dart';


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
        child: Column(
          children: [
            // Header with Image
            Expanded(
              flex: 4,
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
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            size: 18, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 16,
                    right: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent, // Or white if preferred
                      child: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            
            // Details
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(24),
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
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.green, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                widget.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.teal[700],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          '\$ ${widget.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B5E37),
                          ),
                        ),
                        Text(
                          ' ${widget.unit}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // Discount placeholder if needed, skipping for now based on image
                    
                    const SizedBox(height: 32),
                    
                    // Quantity Selector
                    Row(
                      children: [
                        const Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 16,
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
                              ),
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    fontSize: 16,
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.unit.replaceAll('/', ''), // e.g. "Pound" from "/ Pound"
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
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
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart_outlined, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
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
                              backgroundColor: const Color(0xFF0E4F4F), // Slightly darker for Buy Now
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_bag_outlined, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    fontSize: 16,
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
        ),
      ),
    );
  }
}
