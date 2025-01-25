import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uc_ebook_store/models/book_model.dart';
import 'package:uc_ebook_store/models/cart_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  final String baseUrl = 'http://127.0.0.1:8000/api/cart';

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('Token is not available');
    }
    return token;
  }

  Future<void> addToCart(BookModel book) async {
    final token = await _getToken();

    final response = await http.post(
      Uri.parse(baseUrl + "/${book.id}"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to add to cart: ${response.statusCode}');
    }
  }

  Future<List<CartItemModel>> fetchCartItems() async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => CartItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch cart items: ${response.statusCode}');
    }
  }

  Future<void> deleteCartItem(String id) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete cart item: ${response.statusCode}');
    }
  }
}
