import 'package:flutter/foundation.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, Product> _wishlistItems = {};

  Map<String, Product> get items => {..._wishlistItems};

  int get itemCount => _wishlistItems.length;

  bool isFavorite(String productId) {
    return _wishlistItems.containsKey(productId);
  }

  void toggleFavorite(Product product) {
    if (_wishlistItems.containsKey(product.id)) {
      _wishlistItems.remove(product.id);
    } else {
      _wishlistItems.putIfAbsent(product.id, () => product);
    }
    notifyListeners();
  }

  void clearWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}
