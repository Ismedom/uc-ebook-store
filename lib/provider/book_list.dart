import 'package:flutter/material.dart';
import 'package:uc_ebook_store/models/book_model.dart';
import 'package:uc_ebook_store/services/book_service.dart';

class BookListProvider with ChangeNotifier {
  final List<BookModel> _books = [];
  final BookService _bookService = BookService();

  List<BookModel> get books => _books;

  Future<void> fetchBooks() async {
    try {
      final books = await _bookService.fetchBooks();
      _books.clear();
      _books.addAll(books);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch books: $e');
    }
  }

  Future<void> fetchBookById(int id) async {
    try {
      final book = await _bookService.fetchBookById(id);
      final index = _books.indexWhere((b) => b.id == id);
      if (index != -1) {
        _books[index] = book;
      } else {
        _books.add(book);
      }
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch book: $e');
    }
  }

  Future<void> updateBook(int id, BookModel updatedBook) async {
    try {
      await _bookService.updateBook(id, updatedBook);
      final index = _books.indexWhere((book) => book.id == id);
      if (index != -1) {
        _books[index] = updatedBook;
        notifyListeners();
      }
    } catch (e) {
      throw Exception('Failed to update book: $e');
    }
  }

  Future<void> deleteBook(int id) async {
    try {
      await _bookService.deleteBook(id);
      _books.removeWhere((book) => book.id == id);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to delete book: $e');
    }
  }
}
