import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CartItem {
  final String name;
  final int quantity; 
  final double price; 
  final String size;
  final int sugar;

  CartItem({required this.name, required this.quantity, required this.price, required this.size, required this.sugar});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  Future<void> placeOrder() async {
    try {
      final orderData = {
        'items': _items.map((item) => {
              'name': item.name,
              'quantity': item.quantity,
              'price': item.price,
              'size': item.size,
              'sugar': item.sugar,
            }).toList(),
        'totalPrice': totalPrice,
        'timestamp': Timestamp.now(),
      };

      await _firestore.collection('orders').add(orderData);

      _items.clear();
      notifyListeners();
      print('Order placed successfully!');
    } catch (e) {
      print('Failed to place order: $e');
    }
  }
}
