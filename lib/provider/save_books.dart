// import 'package:flutter/material.dart';
// import 'package:uc_ebook_store/models/book_model.dart';
// import 'package:uc_ebook_store/services/book_service.dart';

// class SaveBooksProvider with ChangeNotifier {
//   final List<BookModel> _savedBooks = [];
//   final BookService _bookService = BookService();

//   List<BookModel> get savedBooks => _savedBooks;

//   // Future<void> addToSavedBooks(BookModel book) async {
//   //   try {
//   //     await _bookService.addToFavourites(book);
//   //     notifyListeners();
//   //   } catch (e) {
//   //     throw Exception('Failed to save book: $e');
//   //   }
//   // }

//   // Remove a book from saved books
//   Future<void> removeFromSavedBooks(int id) async {
//     try {
//       await _bookService.removeFromFavourites(id);
//       _savedBooks.removeWhere((book) => book.id == id);
//       notifyListeners();
//     } catch (e) {
//       throw Exception('Failed to remove book: $e');
//     }
//   }

//   // Check if a book is saved
//   bool isBookSaved(int id) {
//     return _savedBooks.any((book) => book.id == id);
//   }
// }
