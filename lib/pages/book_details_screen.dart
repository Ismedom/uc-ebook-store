import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uc_ebook_store/models/book_model.dart';
import 'package:uc_ebook_store/provider/cart_provider.dart';

class BookDetailsScreen extends StatefulWidget {
  final BookModel book;

  const BookDetailsScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool isLoadingCart = false;
  bool isLoadingSave = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.book.title),
        previousPageTitle: 'Back',
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBookCover(),
              _buildTitle(),
              const SizedBox(height: 8),
              _buildAuthor(),
              const SizedBox(height: 16),
              _buildPrice(),
              const SizedBox(height: 16),
              _buildDescription(),
              const SizedBox(height: 24),
              _buildActionButtons(cartProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        widget.book.coverImageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 300,
            color: CupertinoColors.activeOrange,
            child: const Icon(
              CupertinoIcons.book,
              size: 50,
              color: CupertinoColors.systemGrey,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.book.title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAuthor() {
    return Text(
      'By ${widget.book.author}',
      style: const TextStyle(
        fontSize: 18,
        color: CupertinoColors.systemGrey,
      ),
    );
  }

  Widget _buildPrice() {
    return Text(
      '\$${widget.book.price.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.activeOrange,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.book.description,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }

  Widget _buildActionButtons(CartProvider cartProvider) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: CupertinoButton(
              color: CupertinoColors.activeOrange,
              borderRadius: BorderRadius.circular(8),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: isLoadingCart
                  ? _buildLoadingIndicator()
                  : const Text(
                      'Add to Cart',
                      style: TextStyle(color: CupertinoColors.black),
                    ),
              onPressed:
                  isLoadingCart ? null : () => _handleAddToCart(cartProvider),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(color: CupertinoColors.white),
        SizedBox(width: 5),
        Text('Processing...', style: TextStyle(color: CupertinoColors.black)),
      ],
    );
  }

  void _handleAddToCart(CartProvider cartProvider) async {
    setState(() => isLoadingCart = true);
    try {
      await cartProvider.addToCart(widget.book);
      print('Book added to cart');
    } catch (e) {
      print('Failed to add to cart: $e');
    } finally {
      setState(() => isLoadingCart = false);
    }
  }
}
