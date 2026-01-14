import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../product_details/product_details_screen.dart';
import '../../../../utils/responsive_helper.dart';

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
                  'Vegetables',
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
              final isTomato = index % 2 == 0;
              return _buildProductCard(
                responsive,
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
          );
        },
      ),
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
                    color: Color(0xFFF2F2F2), // Light grey background for image
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: responsive.adaptiveSize(24.0, 28.0),
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
                  Row(children: [
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
                  ]),
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
