import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navbar_controller.dart';
import 'home_controller.dart';
import 'vegetable/vegetable_ui.dart';
import 'fruits/fruits_ui.dart';
import 'greens/greens_ui.dart';
import 'dairy/dairy_ui.dart';
import 'dry_groceries/dry_groceries_ui.dart';
import '../../product_details/product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      final navbarController = Get.find<NavbarController>();
                      navbarController.changeIndex(3); // Navigate to Profile tab
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/zora.png'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Zara',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome to App',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar & Filter
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Product...',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[500],
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      _showFilterBottomSheet(context, controller);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B5E37), // Dark Green
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        'assets/icons/filter.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Promotional Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF06AA87), Color(0xFF50634B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icons/giftbox.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New product available here.',
                            style: TextStyle(
                                color: Color(0xFFFBFFBE),

                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Check out our new product today',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // All Categories Title
              Row(
                children: [
                  Image.asset(
                    'assets/icons/filter.png',
                    width: 24,
                    height: 24,
                    color: const Color(0xFF2C3E50),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'All Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Product Grid
              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6, // Adjusted for card height
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                          name: product.name,
                          imagePath: product.image,
                          price: double.parse(product.price),
                          description: product.description,
                          unit: product.unit,
                          rating: product.rating,
                          reviews: product.reviews,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    product.image,
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Obx(
                                    () => GestureDetector(
                                      onTap: () => product.isFavorite.toggle(),
                                      child: product.isFavorite.value
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 24,
                                            )
                                          : Image.asset(
                                              'assets/icons/favourite.png',
                                              width: 24,
                                              height: 24,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xFF4CAF50),
                                            size: 16,
                                          ),
                                          Text(
                                            ' ${product.rating} (${product.reviews})',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF407260),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product.description,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF407260),
                                      height: 1.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        '\$ ${product.price}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xFF1B5E37),
                                        ),
                                      ),
                                      Text(
                                        ' ${product.unit}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 36,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF1B5E37),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: const Text(
                                        '+ Add to Cart',
                                        style: TextStyle(
                                          fontSize: 14,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context, HomeController controller) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...controller.categories
                  .map(
                    (category) => GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        if (category == 'Vegetables') {
                          Get.to(() => const VegetableUi());
                        } else if (category == 'Fruits') {
                          Get.to(() => const FruitsUi());
                        } else if (category == 'Greens') {
                          Get.to(() => const GreensUi());
                        } else if (category == 'Dairy') {
                          Get.to(() => const DairyUi());
                        } else if (category == 'Dry Groceries') {
                          Get.to(() => const DryGroceriesUi());
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
