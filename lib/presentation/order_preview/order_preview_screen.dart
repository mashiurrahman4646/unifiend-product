import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 250,
                width: double.infinity,
                color: const Color(0xFFF2F2F2),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Product Name
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            
            // Price Breakdown
            Row(
              children: [
                Text(
                  '\$ ${widget.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E37),
                  ),
                ),
                 Text(
                   ' ${widget.unit}',
                   style: const TextStyle(
                     fontSize: 14,
                     color: Colors.grey,
                   ),
                 ),
              ],
            ),
            const SizedBox(height: 8),
            // Mock Discount / Original Price (As seen in image)
             Row(
              children: [
                 const Text(
                  '\$ 3.50',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 16),
                 Text(
                  '-\$ 1.50',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[300],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Quantity Selector
             Row(
              children: [
                 const Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 16),
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
                          width: 30,
                          height: 30,
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
                           icon: const Icon(Icons.remove, size: 16, color: Colors.black),
                         ),
                       ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       Container(
                          margin: const EdgeInsets.all(4),
                          width: 30,
                          height: 30,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                              color: Colors.grey[400], // Darker grey for + as per image implication/style
                              borderRadius: BorderRadius.circular(4),
                           ),
                         child: IconButton(
                           padding: EdgeInsets.zero,
                           onPressed: () {
                             setState(() {
                               quantity++;
                             });
                           },
                           icon: const Icon(Icons.add, size: 16, color: Colors.white),
                         ),
                       ),
                    ],
                  ),
                ),
                 const SizedBox(width: 12),
                 Text(
                   widget.unit.replaceAll('/', ''),
                   style: const TextStyle(
                     fontSize: 16,
                     color: Colors.green,
                     fontWeight: FontWeight.w500
                   ),
                 ),
              ],
            ),

            const Spacer(),

            // Buy Now Button
            SizedBox(
              width: double.infinity,
              height: 50,
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
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
