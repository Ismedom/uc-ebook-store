class CartItemModel {
  final int id;
  final String user_carting_id;
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String author;
  final double rating;
  final String description;
  final String coverImageUrl;

  CartItemModel({
    required this.id,
    required this.user_carting_id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
    required this.author,
    required this.rating,
    required this.description,
    required this.coverImageUrl,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as int,
      user_carting_id: json['user_carting_id'].toString(),
      productId: json['product_id'].toString(),
      title: json['title'] as String? ?? '',
      quantity:
          json['quantity'] != null ? int.parse(json['quantity'].toString()) : 0,
      price:
          json['price'] != null ? double.parse(json['price'].toString()) : 0.0,
      author: json['author'] as String? ?? '',
      rating: json['rating'] != null
          ? double.parse(json['rating'].toString())
          : 0.0,
      description: json['description'] as String? ?? '',
      coverImageUrl: json['coverImageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_carting_id': user_carting_id,
      'product_id': productId,
      'title': title,
      'quantity': quantity,
      'price': price,
      'author': author,
      'rating': rating,
      'description': description,
      'coverImageUrl': coverImageUrl,
    };
  }
}
