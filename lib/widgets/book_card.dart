// book_card.dart
import 'package:flutter/cupertino.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final double price;
  final VoidCallback onTap;

  const BookCard({
    Key? key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 120, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(author,
                style: const TextStyle(color: CupertinoColors.systemGrey)),
            Text('$price',
                style: const TextStyle(color: CupertinoColors.activeGreen)),
          ],
        ),
      ),
    );
  }
}
