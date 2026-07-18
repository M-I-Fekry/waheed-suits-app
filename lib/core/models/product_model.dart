class ProductModel {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final int reviewsCount;
  final String image;
  final String tag;

  ProductModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.image,
    required this.tag,
  });
}