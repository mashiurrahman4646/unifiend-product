import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Injecting controller for data source.
    final controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: controller.items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red.shade100), // Matching the reddish border in image
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Section
                        Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            // color: const Color(0xFFEFEBE9), 
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(item.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Details Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => controller.removeItem(index),
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: Colors.green.shade300, // Light green trash icon in image? Or grey. Looks greenish grey.
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.teal, // Teal-ish color for description
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    '\$ ${item.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green, // Dark green price
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ' ${item.unit}',
                                    style: const TextStyle(
                                      color: Colors.green, // Unit also seems green in the image
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  // Quantity Controls - Simple Row: Minus Number Plus
                                  Row(
                                    children: [
                                      // Minus
                                      GestureDetector(
                                        onTap: () => controller.decrement(index),
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100, // Very light background
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: const Icon(Icons.remove, size: 16, color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        '${item.quantity.value}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      // Plus
                                      GestureDetector(
                                        onTap: () => controller.increment(index),
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: const Icon(Icons.add, size: 16, color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          // Bottom Summary Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: SafeArea(
              child: Row(
               // The design has Subtotal and Shipping on the left in a Column, and Checkout Button on the right.
               // Let's re-examine image 2.
               // It's:
               // Subtotal : $ 7.50      [ Checkout (3) ]
               // Shipping Subtotal: $ 5.00
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() => RichText(
                        text: TextSpan(
                          children: [
                             const TextSpan(text: 'Subtotal : ', style: TextStyle(color: Colors.black87, fontSize: 13)),
                             TextSpan(text: '\$ ${controller.subtotal.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      )),
                      const SizedBox(height: 4),
                      Obx(() => RichText(
                        text: TextSpan(
                          children: [
                             const TextSpan(text: 'Shipping Subtotal: ', style: TextStyle(color: Colors.black87, fontSize: 13)),
                             TextSpan(text: '\$ ${controller.shipping.value.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004D40), // Dark green
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Obx(() => Text(
                          'Checkout (${controller.itemCount})',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
