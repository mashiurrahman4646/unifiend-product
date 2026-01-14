import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../product_details/product_details_screen.dart';
import '../../../../utils/responsive_helper.dart';

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
        title: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Row(
              children: [
                Image.asset(
                  'assets/icons/filter.png',
                  width: responsive.adaptiveSize(24.0, 30.0),
                  height: responsive.adaptiveSize(24.0, 30.0),
                  color: Colors.black54,
                ),
                const SizedBox(width: 8),
                Text(
                  'Fruits',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: responsive.adaptiveSize(20.0, 26.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return GridView.builder(
            padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 24.0)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsive.gridCrossAxisCount,
              childAspectRatio: responsive.gridChildAspectRatio,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return _buildItem(index, responsive);
            },
          );
        },
      ),
    );
  }

  Widget _buildItem(int index, ResponsiveHelper responsive) {
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
      responsive,
      name: name,
      rating: 4.5,
      reviews: 201,
      description: description,
      price: price,
      unit: unit,
      imagePath: imagePath,
    );
  }

  Widget _buildProductCard(
    ResponsiveHelper responsive, {
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
                  height: responsive.adaptiveSize(120.0, 180.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: responsive.adaptiveSize(40.0, 50.0), color: Colors.grey),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white, // White heart on image
                    size: responsive.adaptiveSize(24.0, 28.0),
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.adaptiveSize(16.0, 18.0),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.green, size: responsive.adaptiveSize(14.0, 16.0)),
                          Text(
                            ' $rating ($reviews)',
                            style: TextStyle(
                              fontSize: responsive.adaptiveSize(12.0, 14.0),
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
                      fontSize: responsive.adaptiveSize(12.0, 14.0),
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
                        style: TextStyle(
                          color: const Color(0xFF1B5E37),
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.adaptiveSize(16.0, 18.0),
                        ),
                      ),
                      Text(
                        unit,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: responsive.adaptiveSize(12.0, 14.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: responsive.adaptiveSize(36.0, 44.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5E37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        '+ Add to Cart',
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(14.0, 16.0),
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
  }
}
