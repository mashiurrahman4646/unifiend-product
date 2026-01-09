import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../product_details/product_details_screen.dart';

class FruitsUi extends StatelessWidget {
  const FruitsUi({super.key});

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
        title: Row(
          children: [
            Image.asset(
              'assets/icons/filter.png',
              width: 24,
              height: 24,
              color: Colors.black54,
            ),
            const SizedBox(width: 8),
            const Text(
              'Fruits',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    String name = '';
    String description = '';
    double price = 0.0;
    String unit = '';
    String imagePath = '';

    if (index == 0) {
      name = 'Apple';
      description = 'Fresh, naturally ripened organic apples.';
      price = 10.50;
      unit = '/Case';
      imagePath = 'assets/images/apple.png';
    } else if (index == 1) {
      name = 'Banana';
      description = 'Fresh, naturally ripened organic bananas.';
      price = 2.50;
      unit = '/Case';
      imagePath = 'assets/images/banana.png';
    } else if (index == 2) {
      name = 'Orange';
      description = 'Fresh, naturally ripened organic oranges.';
      price = 10.50;
      unit = '/Case';
      imagePath = 'assets/images/orange.png';
    } else {
      name = 'Banana';
      description = 'Fresh, naturally ripened organic bananas.';
      price = 2.50;
      unit = '/Case';
      imagePath = 'assets/images/banana.png';
    }

    return _buildProductCard(
      name: name,
      rating: 4.5,
      reviews: 201,
      description: description,
      price: price,
      unit: unit,
      imagePath: imagePath,
    );
  }

  Widget _buildProductCard({
    required String name,
    required double rating,
    required int reviews,
    required String description,
    required double price,
    required String unit,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
          name: name,
          imagePath: imagePath,
          price: price,
          description: description,
          unit: unit,
          rating: rating,
          reviews: reviews,
        ));
      },
      child: Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Image Section
          Stack(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white, // White heart on image
                ),
              ),
            ],
          ),

          // Details Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
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
                        const Icon(Icons.star, color: Colors.green, size: 14),
                        Text(
                          ' $rating ($reviews)',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.teal[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$ ${price.toStringAsFixed(2)} ',
                      style: const TextStyle(
                        color: Color(0xFF1B5E37),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      unit,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
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
    ));
  }
}
