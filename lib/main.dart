import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uc_ebook_store/pages/book_store_screen.dart';
import 'package:uc_ebook_store/pages/login_screen.dart';
import 'package:uc_ebook_store/pages/home_screen.dart';
import 'package:uc_ebook_store/pages/cart_screen.dart';
import 'package:uc_ebook_store/pages/search_screen.dart';
import 'package:uc_ebook_store/provider/auth_provider.dart';
import 'package:uc_ebook_store/provider/book_list.dart';
import 'package:uc_ebook_store/provider/cart_provider.dart';
import 'package:uc_ebook_store/provider/searching_provider.dart';
import 'package:uc_ebook_store/provider/theme.dart';
import 'package:uc_ebook_store/utils/routes.dart';
import 'package:uc_ebook_store/utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookListProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => SearchingProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const BookSt(),
    ),
  );
}

class BookSt extends StatelessWidget {
  const BookSt({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "e-book store",
      theme: AppTheme.darkTheme,
      home: LoginScreen(),
      routes: AppRoutes.getRoutes(),
    );
  }
}

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Book Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
        ],
      ),
      // Tabs
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomeScreen();
              case 1:
                return CartScreen();
              case 2:
                return BookStoreScreen();
              case 3:
                return SearchScreen();
              default:
                return HomeScreen();
            }
          },
        );
      },
    );
  }
}
