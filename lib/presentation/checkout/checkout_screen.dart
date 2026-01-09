import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      // Product Card
                      Container(
                        padding: const EdgeInsets.all(12),
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
                               height: 150,
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
                             const SizedBox(height: 16),
                             Text(
                               name,
                               style: const TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             const SizedBox(height: 8),
                             Row(
                               children: [
                                 Text(
                                   '\$ ${price.toStringAsFixed(2)}',
                                   style: const TextStyle(
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                     color: Color(0xFF1B5E37),
                                   ),
                                 ),
                                 Text(
                                   unit,
                                   style: const TextStyle(
                                     color: Colors.grey,
                                     fontSize: 14,
                                   ),
                                 ),
                               ],
                             ),
                             const SizedBox(height: 16),
                             Row(
                               children: [
                                 const Icon(Icons.search, color: Colors.transparent, size: 0), // Hack for spacing if needed or just replace with spacer
                                 const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w500)),
                                 const SizedBox(width: 16),
                                 Container(
                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                   decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                   ),
                                   child: Text(
                                     quantity.toString(), 
                                     style: const TextStyle(fontWeight: FontWeight.bold)
                                   ),
                                 ),
                                 const SizedBox(width: 8),
                                 Text(
                                    unit.replaceAll('/', ''),
                                    style: const TextStyle(color: Colors.grey),
                                 ),
                               ],
                             ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Delivery Option placeholder
                       const Text(
                        'Delivery or pickup',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Standard Delivery', style: TextStyle(fontWeight: FontWeight.w500)),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                     Icon(Icons.local_shipping, size: 16, color: Colors.green),
                                     SizedBox(width: 4),
                                     Text('Guaranteed by 10-13 Jan', style: TextStyle(fontSize: 12, color: Colors.teal)),
                                  ],
                                )
                              ],
                            ),
                            Text('\$5.00', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B5E37))),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Order Summary Bottom Sheet
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Merchandise Subtotal ($quantity kg/unit)', style: const TextStyle(color: Colors.grey)), // Simplified unit logic
                                Text('\$${subtotal.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B5E37))),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Shipping Subtotal', style: TextStyle(color: Colors.grey)),
                                Text('\$${shipping.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B5E37))),
                              ],
                            ),
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total :', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B5E37))),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
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
                                child: const Text(
                                  'Proceed To Pay',
                                  style: TextStyle(
                                    fontSize: 18,
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
