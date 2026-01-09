import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../product_details/product_details_screen.dart';

class VegetableUi extends StatelessWidget {
  const VegetableUi({super.key});

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
              'Vegetables',
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
          childAspectRatio: 0.6, // Adjusted for overflow
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final isTomato = index % 2 == 0;
          return _buildProductCard(
            name: isTomato ? 'Red Tomatoes' : 'Carrots',
            rating: 4.5,
            reviews: 201,
            description: isTomato
                ? 'Fresh, vine-ripened organic red tomatoes.'
                : 'Fresh, vine-ripened organic Carrots.',
            price: isTomato ? 2.50 : 3.50,
            unit: isTomato ? '/Pound' : '/lb',
            imagePath: isTomato
                ? 'assets/images/tomato.png'
                : 'assets/images/Carrot.png',
          );
        },
      ),
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
                  color: const Color(0xFFF2F2F2), // Light grey background for image
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          
          // Details Section
          Padding(
            padding: const EdgeInsets.all(8.0), // Reduced padding to 8
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
                   ]
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
