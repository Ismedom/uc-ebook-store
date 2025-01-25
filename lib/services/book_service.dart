import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uc_ebook_store/models/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookService {
  final String baseUrl = 'http://localhost:8000/api/product';

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('Token is not available');
    }
    return token;
  }

  Future<List<BookModel>> fetchBooks() async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<BookModel>> filter(String filterTitle) async {
    final token = await _getToken();

    final response = await http.post(
      Uri.parse(baseUrl + "/searching"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'query': filterTitle,
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> filterBook = json.decode(response.body);
      return filterBook.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<BookModel> fetchBookById(int id) async {
    final token = await _getToken();

    final response = await http.get(Uri.parse('$baseUrl/$id'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return BookModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load book');
    }
  }

  Future<void> updateBook(int id, BookModel updatedBook) async {
    final token = await _getToken();

    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(updatedBook),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update book');
    }
  }

  Future<void> deleteBook(int id) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete book');
    }
  }

  Future<void> removeFromFavourites(book) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse('http://localhost:8000/api/save_product/${book.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove from favourites');
    }
  }
}
