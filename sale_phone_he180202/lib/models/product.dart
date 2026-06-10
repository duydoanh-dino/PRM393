class Product {
  final int id;
  final String name;
  final double price;
  final double discountPercent;
  final double starNumber;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPercent,
    required this.starNumber,
    required this.imageUrl,
  });

  double get discountedPrice => price * (1 - discountPercent / 100);
}