// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:uc_ebook_store/models/saved_book.dart';

// class SaveBookService {
//   final String baseUrl = 'http://localhost:8000/api/product';
//   String token = '1|loy9fU857dhVwgsbYGIG8zHWzlKEvavj42fhcSwB1ff481ed';

//   Future<List<SaveProduct>> fetchSavedBooks() async {
//     final response = await http.get(
//       Uri.parse('http://localhost:8000/api/save_product'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body);
//       return responseData.map((json) => SaveProduct.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load saved books');
//     }
//   }
// }
