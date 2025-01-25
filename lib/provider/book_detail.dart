import 'package:flutter/material.dart';
import 'package:uc_ebook_store/models/book_model.dart';
import 'package:uc_ebook_store/models/cart_item_model.dart';
import 'package:uc_ebook_store/services/cart_service.dart';

class CartProvider with ChangeNotifier {
  final List<CartItemModel> _cartItems = [];
  final CartService _cartService = CartService();

  List<CartItemModel> get cartItems => _cartItems;

  Future<void> fetchCartItems() async {
    try {
      final items = await _cartService.fetchCartItems();
      _cartItems.clear();
      _cartItems.addAll(items);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch cart items: $e');
    }
  }

  Future<void> addToCart(BookModel book) async {
    try {
      await _cartService.addToCart(book);
      await fetchCartItems();
    } catch (e) {
      throw Exception('Failed to add item to cart: $e');
    }
  }

  Future<void> deleteCartItem(String id) async {
    try {
      await _cartService.deleteCartItem(id);
      _cartItems.removeWhere((item) => item.id.toString() == id);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to delete cart item: $e');
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double getTotalPrice() {
    return _cartItems.fold(
      0.0,
      (total, item) => total + (item.price * (item.quantity + 1)),
    );
  }

  bool isBookInCart(int id) {
    return _cartItems.any((item) => item.id == id);
  }

  int get cartItemCount => _cartItems.length;
}
