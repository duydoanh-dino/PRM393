import '../models/product.dart';

class ProductDAO {
  static const List<Product> _products = [
    Product(
      id: 1,
      name: 'iPhone 15 Pro Max',
      price: 34990000,
      discountPercent: 10,
      starNumber: 4.9,
      imageUrl: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400',
    ),
    Product(
      id: 2,
      name: 'Samsung Galaxy S24 Ultra',
      price: 29990000,
      discountPercent: 15,
      starNumber: 4.7,
      imageUrl: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400',
    ),
    Product(
      id: 3,
      name: 'Google Pixel 8 Pro',
      price: 22990000,
      discountPercent: 20,
      starNumber: 4.6,
      imageUrl: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400',
    ),
    Product(
      id: 4,
      name: 'Xiaomi 14 Ultra',
      price: 19990000,
      discountPercent: 12,
      starNumber: 4.5,
      imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400',
    ),
    Product(
      id: 5,
      name: 'OnePlus 12',
      price: 17490000,
      discountPercent: 18,
      starNumber: 4.4,
      imageUrl: 'https://images.unsplash.com/photo-1585060544812-6b45742d762f?w=400',
    ),
    Product(
      id: 6,
      name: 'OPPO Find X7 Pro',
      price: 21990000,
      discountPercent: 8,
      starNumber: 4.3,
      imageUrl: 'https://images.unsplash.com/photo-1574944985070-8f3ebc6b79d2?w=400',
    ),
  ];

  List<Product> getAllProducts() => List.unmodifiable(_products);

  List<Product> findProductByName(String name) {
    final query = name.toLowerCase();
    return _products
        .where((p) => p.name.toLowerCase().contains(query))
        .toList();
  }
}