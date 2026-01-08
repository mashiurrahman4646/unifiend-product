import 'package:get/get.dart';

class Product {
  final String name;
  final String description;
  final String price;
  final String unit;
  final String image;
  final double rating;
  final int reviews;
  final RxBool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.image,
    required this.rating,
    required this.reviews,
    bool isFavorite = false,
  }) : isFavorite = isFavorite.obs;
}

class HomeController extends GetxController {
  final categories = [
    'Vegetables',
    'Fruits',
    'Greens',
    'Dairy',
    'Dry Groceries',
  ];

  final products = <Product>[
    Product(
      name: 'Red Tomatoes',
      description: 'Fresh, vine-ripened organic red tomatoes.',
      price: '2.50',
      unit: '/Pound',
      image: 'assets/images/tomato.png',
      rating: 4.5,
      reviews: 201,
    ),
    Product(
      name: 'Carrots',
      description: 'Fresh, vine-ripened organic Carrots.',
      price: '3.50',
      unit: '/lb',
      image: 'assets/images/Carrot.png',
      rating: 4.5,
      reviews: 201,
    ),
    Product(
      name: 'Apple',
      description: 'Fresh, naturally ripened organic apples.',
      price: '10.50',
      unit: '/Case',
      image: 'assets/images/apple.png',
      rating: 4.5,
      reviews: 201,
    ),
    Product(
      name: 'Banana',
      description: 'Fresh, naturally ripened organic bananas.',
      price: '2.50',
      unit: '/Case',
      image: 'assets/images/banana.png',
      rating: 4.5,
      reviews: 201,
    ),
  ].obs;

  void showFilterBottomSheet() {
    // Logic to show bottom sheet will be handled in UI,
    // but controller can hold filter state if needed.
  }
}
