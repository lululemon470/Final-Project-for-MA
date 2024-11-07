import 'package:flutter/material.dart';

// Define a CartItem model
class CartItem {
  final String id;
  final String title;
  final String price;
  final String image;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  // Get the items in the cart
  Map<String, CartItem> get items {
    return {..._items};
  }

  // Get the number of items in the cart
  int get itemCount {
    return _items.length;
  }

  // Add an item to the cart
  void addToCart(String id, String title, String price, String image) {
    if (_items.containsKey(id)) {
      return; // Item is already in the cart, so we won't add it again
    } else {
      _items.putIfAbsent(
        id,
            () => CartItem(id: id, title: title, price: price, image: image),
      );
    }
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItem(String id) {
    _items.remove(id);
    notifyListeners(); // Notify listeners to update UI
  }
}
