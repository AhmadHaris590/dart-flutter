class Product {
  const Product({
    required this.title,
    required this.category,
    required this.priceLabel,
    required this.statusBadge,
    required this.imageUrl,
  });

  final String title;
  final String category;
  final String priceLabel;
  final String statusBadge;
  final String imageUrl;
}