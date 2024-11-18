import 'package:flutter/foundation.dart';

class CartItem {
  final String name; // Nama produk
  final int quantity; // Jumlah produk
  final double price; // Harga produk
  final String size;
  final int sugar;

  CartItem({required this.name, required this.quantity, required this.price, required this.size, required this.sugar});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = []; // Daftar item yang ada di keranjang

  List<CartItem> get items => _items; // Mengambil daftar item

  void addItem(CartItem item) {
    _items.add(item); // Menambahkan item ke keranjang
    notifyListeners(); // Memberitahukan bahwa data telah berubah
  }

  void removeItem(CartItem item) {
    _items.remove(item); // Menghapus item dari keranjang
    notifyListeners(); // Memberitahukan bahwa data telah berubah
  }

  double get totalPrice => // Menghitung total harga
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);
}
