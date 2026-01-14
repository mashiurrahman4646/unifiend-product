import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/responsive_helper.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Padding(
              padding: EdgeInsets.only(left: responsive.adaptiveSize(16.0, 24.0)),
              child: Center(
                child: Container(
                  width: responsive.adaptiveSize(40.0, 50.0),
                  height: responsive.adaptiveSize(40.0, 50.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: responsive.adaptiveSize(18.0, 22.0), color: Colors.black),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            );
          },
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Text(
              'My Favorites',
              style: TextStyle(
                color: Colors.black,
                fontSize: responsive.adaptiveSize(18.0, 22.0),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return ListView(
            padding: EdgeInsets.all(responsive.adaptiveSize(20.0, 32.0)),
            children: [
              _buildFavoriteItem(
                responsive,
                image: 'assets/images/tomato.png',
                title: 'Red Tomatoes',
                description: 'Fresh, vine-ripened organic red tomatoes.',
                price: 2.50,
                unit: '/Pound',
              ),
              SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
              _buildFavoriteItem(
                responsive,
                image: 'assets/images/tomato.png',
                title: 'Red Tomatoes',
                description: 'Fresh, vine-ripened organic red tomatoes.',
                price: 2.50,
                unit: '/Pound',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFavoriteItem(
    ResponsiveHelper responsive, {
    required String image,
    required String title,
    required String description,
    required double price,
    required String unit,
  }) {
    return Container(
      padding: EdgeInsets.all(responsive.adaptiveSize(12.0, 16.0)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              Container(
                width: responsive.adaptiveSize(100.0, 130.0),
                height: responsive.adaptiveSize(80.0, 100.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF5F5F5),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Icon(Icons.favorite,
                    color: Colors.red, size: responsive.adaptiveSize(18.0, 22.0)),
              ),
            ],
          ),
          SizedBox(width: responsive.adaptiveSize(12.0, 16.0)),
          // Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(15.0, 17.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    // Add to Cart Button
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsive.adaptiveSize(8.0, 10.0),
                          vertical: responsive.adaptiveSize(4.0, 6.0)),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add,
                              color: Colors.white, size: responsive.adaptiveSize(12.0, 14.0)),
                          const SizedBox(width: 4),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsive.adaptiveSize(10.0, 12.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: responsive.adaptiveSize(12.0, 14.0),
                    color: const Color(0xFF4DB6AC),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
                Row(
                  children: [
                    Text(
                      '\$ ${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(14.0, 16.0),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2E7D32),
                      ),
                    ),
                    Text(
                      ' $unit',
                      style: TextStyle(
                        fontSize: responsive.adaptiveSize(12.0, 14.0),
                        color: const Color(0xFF2E7D32),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
