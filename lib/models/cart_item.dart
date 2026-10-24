import 'product.dart';

class CartItem {
  final String id;
  final Product product;
  int quantity;
  String selectedSize;
  String selectedColor;

  CartItem({
    required this.id,
    required this.product,
    this.quantity = 1,
    this.selectedSize = 'US Men 9',
    this.selectedColor = 'Silver / Electric blue',
  });
}
