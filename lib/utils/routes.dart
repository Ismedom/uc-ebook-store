import 'package:flutter/cupertino.dart';
import 'package:uc_ebook_store/pages/login_screen.dart';
import 'package:uc_ebook_store/pages/home_screen.dart';
import 'package:uc_ebook_store/pages/cart_screen.dart';
import 'package:uc_ebook_store/pages/search_screen.dart';
import 'package:uc_ebook_store/pages/book_store_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/login': (context) => LoginScreen(),
      '/home': (context) => HomeScreen(),
      '/cart': (context) => CartScreen(),
      '/search': (context) => SearchScreen(),
      '/book-store': (context) => BookStoreScreen(),
    };
  }
}
