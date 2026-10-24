import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  double _discountPercent = 0.0;

  Map<String, CartItem> get items => {..._items};

  int get itemCount {
    int count = 0;
    _items.forEach((key, item) {
      count += item.quantity;
    });
    return count;
  }

  int get uniqueItemCount => _items.length;

  double get subtotal {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  double get discountPercent => _discountPercent;

  double get discountAmount => subtotal * _discountPercent;

  double get estimatedTax => (subtotal - discountAmount) * 0.08; // 8% tax

  double get totalAmount => (subtotal - discountAmount) + estimatedTax;

  bool applyPromoCode(String code) {
    final cleanCode = code.trim().toUpperCase();
    if (cleanCode == 'CLUB10' || cleanCode == 'PACE10') {
      _discountPercent = 0.10;
      notifyListeners();
      return true;
    } else if (cleanCode == 'PACE20') {
      _discountPercent = 0.20;
      notifyListeners();
      return true;
    }
    return false;
  }

  void addItem(Product product, {String size = 'US Men 9', String color = 'Silver / Electric blue'}) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existing) => CartItem(
          id: existing.id,
          product: existing.product,
          quantity: existing.quantity + 1,
          selectedSize: existing.selectedSize,
          selectedColor: existing.selectedColor,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: product.id,
          product: product,
          quantity: 1,
          selectedSize: size,
          selectedColor: color,
        ),
      );
    }
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existing) => CartItem(
          id: existing.id,
          product: existing.product,
          quantity: existing.quantity - 1,
          selectedSize: existing.selectedSize,
          selectedColor: existing.selectedColor,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity++;
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    _discountPercent = 0.0;
    notifyListeners();
  }
}
