import 'package:get/get.dart';

class CartItem {
  final String name;
  final String description;
  final String unit;
  final double price;
  final String image;
  final RxInt quantity;
  final RxBool isFavorite;

  CartItem({
    required this.name,
    required this.description,
    required this.unit,
    required this.price,
    required this.image,
    int initialQuantity = 1,
    bool favorite = false,
  })  : quantity = initialQuantity.obs,
        isFavorite = favorite.obs;
}

class CartController extends GetxController {
  final items = <CartItem>[
    CartItem(
      name: 'Organic Red Tomatoes',
      description: 'Fresh, vine-ripened organic red tomatoes.',
      unit: '/Pound',
      price: 2.50,
      image: 'assets/images/tomato.png',
    ),
    CartItem(
      name: 'Organic Red Tomatoes',
      description: 'Fresh, vine-ripened organic red tomatoes.',
      unit: '/Pound',
      price: 2.50,
      image: 'assets/images/tomato.png',
    ),
    CartItem(
      name: 'Organic Red Tomatoes',
      description: 'Fresh, vine-ripened organic red tomatoes.',
      unit: '/Pound',
      price: 2.50,
      image: 'assets/images/tomato.png',
    ),
  ].obs;

  final shipping = 5.00.obs;

  double get subtotal =>
      items.fold(0.0, (sum, i) => sum + (i.price * i.quantity.value));

  int get itemCount => items.fold(0, (sum, i) => sum + i.quantity.value);

  void increment(int index) {
    items[index].quantity.value++;
    items.refresh();
  }

  void decrement(int index) {
    if (items[index].quantity.value > 1) {
      items[index].quantity.value--;
      items.refresh();
    }
  }

  void toggleFavorite(int index) {
    items[index].isFavorite.toggle();
    items.refresh();
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}
