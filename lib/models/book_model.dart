class BookModel {
  final int id;
  final String title;
  final String author;
  final double price;
  final double rating;
  final String description;
  final String coverImageUrl;
  final DateTime? created_at;
  final DateTime? updated_at;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
    required this.description,
    required this.coverImageUrl,
    this.created_at,
    this.updated_at,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      price: double.parse(json['price'].toString()),
      rating: double.parse(json['rating'].toString()),
      description: json['description'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      created_at: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updated_at: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }
}
