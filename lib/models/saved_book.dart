class SaveProduct {
  final int id;
  final String title;
  final int productId;
  final int userSavedId;
  final int shopId;
  final String author;
  final double price;
  final double rating;
  final String description;
  final String coverImageUrl;

  SaveProduct({
    required this.id,
    required this.title,
    required this.productId,
    required this.userSavedId,
    required this.shopId,
    required this.author,
    required this.price,
    required this.rating,
    required this.description,
    required this.coverImageUrl,
  });

  factory SaveProduct.fromJson(Map<String, dynamic> json) {
    return SaveProduct(
      id: json['id'],
      title: json['title'],
      productId: json['product_id'],
      userSavedId: json['user_saved_id'],
      shopId: json['shop_id'],
      author: json['author'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      description: json['description'],
      coverImageUrl: json['coverImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'product_id': productId,
      'user_saved_id': userSavedId,
      'shop_id': shopId,
      'author': author,
      'price': price,
      'rating': rating,
      'description': description,
      'coverImageUrl': coverImageUrl,
    };
  }
}
