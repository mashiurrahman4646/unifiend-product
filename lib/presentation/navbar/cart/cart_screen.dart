import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';
import '../../../utils/responsive_helper.dart';

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
        centerTitle: true,
        title: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Text(
              'Cart',
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

          return Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsive.horizontalPadding,
                        vertical: responsive.adaptiveSize(10.0, 16.0)),
                    itemCount: controller.items.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: responsive.adaptiveSize(12.0, 16.0)),
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return Container(
                        padding: EdgeInsets.all(responsive.adaptiveSize(12.0, 16.0)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red.shade100),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image Section
                            Container(
                              width: responsive.adaptiveSize(100.0, 130.0),
                              height: responsive.adaptiveSize(80.0, 100.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(item.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: responsive.adaptiveSize(12.0, 16.0)),
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: responsive.adaptiveSize(15.0, 17.0),
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.removeItem(index),
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: Colors.green.shade300,
                                          size: responsive.adaptiveSize(20.0, 24.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: responsive.adaptiveSize(12.0, 14.0),
                                    ),
                                  ),
                                  SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                                  Row(
                                    children: [
                                      Text(
                                        '\$ ${item.price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontSize: responsive.adaptiveSize(14.0, 16.0),
                                        ),
                                      ),
                                      Text(
                                        ' ${item.unit}',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: responsive.adaptiveSize(12.0, 14.0),
                                        ),
                                      ),
                                      const Spacer(),
                                      // Quantity Controls
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => controller.decrement(index),
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                                            borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Icon(Icons.remove,
                                                  size: responsive.adaptiveSize(16.0, 20.0),
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(width: responsive.adaptiveSize(12.0, 16.0)),
                                          Text(
                                            '${item.quantity.value}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: responsive.adaptiveSize(14.0, 16.0),
                                              color: Colors.teal,
                                            ),
                                          ),
                                          SizedBox(width: responsive.adaptiveSize(12.0, 16.0)),
                                          GestureDetector(
                                            onTap: () => controller.increment(index),
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Icon(Icons.add,
                                                  size: responsive.adaptiveSize(16.0, 20.0),
                                                  color: Colors.grey),
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
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.adaptiveSize(20.0, 24.0),
                    vertical: responsive.adaptiveSize(16.0, 20.0)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Colors.grey.shade200)),
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() => RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Subtotal : ',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: responsive.adaptiveSize(13.0, 15.0))),
                                    TextSpan(
                                        text: '\$ ${controller.subtotal.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: responsive.adaptiveSize(13.0, 15.0))),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 4),
                          Obx(() => RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Shipping Subtotal: ',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: responsive.adaptiveSize(13.0, 15.0))),
                                    TextSpan(
                                        text:
                                            '\$ ${controller.shipping.value.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: responsive.adaptiveSize(13.0, 15.0))),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF004D40), // Dark green
                          padding: EdgeInsets.symmetric(
                              horizontal: responsive.adaptiveSize(24.0, 32.0),
                              vertical: responsive.adaptiveSize(12.0, 16.0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Obx(() => Text(
                              'Checkout (${controller.itemCount})',
                              style: TextStyle(
                                fontSize: responsive.adaptiveSize(15.0, 17.0),
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
          );
        },
      ),
    );
  }
}
