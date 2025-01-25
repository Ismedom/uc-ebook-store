// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:uc_ebook_store/models/book_model.dart';
// import 'package:uc_ebook_store/pages/book_details_screen.dart';
// import 'package:uc_ebook_store/provider/save_books.dart';

// class SavedBooksScreen extends StatelessWidget {
//   const SavedBooksScreen({super.key});

//   void _showDeleteConfirmation(BuildContext context, BookModel book) {
//     showCupertinoDialog(
//       context: context,
//       builder: (context) => CupertinoAlertDialog(
//         title: const Text('Remove from Favorites'),
//         content: Text('Remove "${book.title}" from saved books?'),
//         actions: [
//           CupertinoDialogAction(
//             child: const Text('Cancel'),
//             onPressed: () => Navigator.pop(context),
//           ),
//           CupertinoDialogAction(
//             isDestructiveAction: true,
//             child: const Text('Remove'),
//             onPressed: () {
//               Navigator.pop(context);
//               _deleteBook(context, book);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _deleteBook(BuildContext context, BookModel book) {
//     // final provider = Provider.of<SaveBooksProvider>(context, listen: false);
//     provider.removeFromSavedBooks(book.id).catchError((error) {
//       showCupertinoDialog(
//         context: context,
//         builder: (context) => CupertinoAlertDialog(
//           title: const Text('Error'),
//           content: const Text('Failed to remove book from favorites'),
//           actions: [
//             CupertinoDialogAction(
//               child: const Text('OK'),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final saveBooksProvider = Provider.of<SaveBooksProvider>(context);
//     final savedBooks = saveBooksProvider.savedBooks;

//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('Saved Books'),
//       ),
//       child: SafeArea(
//         child: savedBooks.isEmpty
//             ? const Center(child: Text('No saved books yet'))
//             : ListView.builder(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: savedBooks.length,
//                 itemBuilder: (context, index) {
//                   final book = savedBooks[index];
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     child: GestureDetector(
//                       onTap: () => Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                           builder: (context) => BookDetailsScreen(book: book),
//                         ),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Book Cover Image
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               book.coverImageUrl,
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   _buildErrorImage(),
//                             ),
//                           ),
//                           const SizedBox(width: 16),

//                           // Book Details
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   book.title,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   'By ${book.author}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: CupertinoColors.systemGrey,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   '\$${book.price.toStringAsFixed(2)}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: CupertinoColors.systemGrey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // Delete Button
//                           CupertinoButton(
//                             padding: EdgeInsets.zero,
//                             onPressed: () =>
//                                 _showDeleteConfirmation(context, book),
//                             child: const Icon(
//                               CupertinoIcons.delete,
//                               color: CupertinoColors.destructiveRed,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }

//   Widget _buildErrorImage() {
//     return Container(
//       width: 80,
//       height: 80,
//       color: CupertinoColors.systemGrey,
//       child: const Icon(
//         CupertinoIcons.photo,
//         color: CupertinoColors.white,
//       ),
//     );
//   }
// }
