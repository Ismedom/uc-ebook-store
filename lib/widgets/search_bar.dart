// search_bar.dart
import 'package:flutter/cupertino.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchBar({
    Key? key,
    required this.controller,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoTextField(
            controller: controller,
            placeholder: 'Search...',
            padding: const EdgeInsets.all(10),
          ),
        ),
        CupertinoButton(
          child: const Icon(CupertinoIcons.search),
          onPressed: onSearch,
        ),
      ],
    );
  }
}
