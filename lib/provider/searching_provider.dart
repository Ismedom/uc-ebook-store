import 'package:flutter/material.dart';
import 'package:uc_ebook_store/models/book_model.dart';

class SearchingProvider with ChangeNotifier {
  final List<BookModel> _allBooks = [];
  List<BookModel> _searchResults = [];

  List<BookModel> get searchResults => _searchResults;

  void setAllBooks(List<BookModel> books) {
    _allBooks.clear();
    _allBooks.addAll(books);
  }

  void searchBooks(String query) {
    if (query.isEmpty) {
      _searchResults.clear();
    } else {
      _searchResults = _allBooks
          .where((book) =>
              book.title.toLowerCase().contains(query.toLowerCase()) ||
              book.author.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _searchResults.clear();
    notifyListeners();
  }
}
