import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uc_ebook_store/provider/book_list.dart';
import 'package:uc_ebook_store/provider/searching_provider.dart';
import 'package:uc_ebook_store/services/book_service.dart';
import 'package:uc_ebook_store/pages/book_details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final bookListProvider = Provider.of<BookListProvider>(context);
    final searchingProvider = Provider.of<SearchingProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final searchSectionHeight = screenHeight * 0.1;

    final filteredBooks = searchQuery.isEmpty
        ? bookListProvider.books
        : searchingProvider.searchResults;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Search'),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: searchSectionHeight,
              child: Container(
                color: CupertinoColors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: CupertinoSearchTextField(
                  placeholder: 'Search for books or categories...',
                  onSubmitted: (value) async {
                    setState(() {
                      searchQuery = value.trim();
                      isLoading = true;
                    });

                    if (searchQuery.isNotEmpty) {
                      try {
                        final bookService = BookService();
                        final filteredBooks =
                            await bookService.filter(searchQuery);
                        searchingProvider.setAllBooks(filteredBooks);
                        searchingProvider.searchBooks(searchQuery);
                      } catch (e) {
                        print('Error searching books: $e');
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } else {
                      searchingProvider.clearSearch();
                    }
                  },
                ),
              ),
            ),
            Positioned(
              top: searchSectionHeight,
              left: 0,
              right: 0,
              bottom: 0,
              child: isLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16.0),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final book = filteredBooks[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            BookDetailsScreen(book: book),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            book.coverImageUrl,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: 80,
                                                height: 80,
                                                color:
                                                    CupertinoColors.systemGrey,
                                                child: const Icon(
                                                  CupertinoIcons.photo,
                                                  color: CupertinoColors.white,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                book.title,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                'By ${book.author}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: CupertinoColors
                                                      .systemGrey,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '\$${book.price.toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: CupertinoColors
                                                      .systemGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              childCount: filteredBooks.length,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
