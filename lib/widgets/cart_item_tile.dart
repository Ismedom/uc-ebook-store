// cart_item_tile.dart
import 'package:flutter/cupertino.dart';

class CartItemTile extends StatelessWidget {
  final String title;
  final String author;
  final double price;
  final VoidCallback onRemove;

  const CartItemTile({
    Key? key,
    required this.title,
    required this.author,
    required this.price,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(author,
                style: const TextStyle(color: CupertinoColors.systemGrey)),
          ],
        ),
        Row(
          children: [
            Text('$price',
                style: const TextStyle(color: CupertinoColors.activeGreen)),
            const SizedBox(width: 10),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.delete,
                  color: CupertinoColors.destructiveRed),
              onPressed: onRemove,
            ),
          ],
        ),
      ],
    );
  }
}
