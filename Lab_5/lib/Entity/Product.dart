import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String id;
  final String? image;
  double price;
  Product({
    required this.name,
    required this.id,
    this.image,
    required this.price,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      id: json['id'],
      image: json['image'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'id': id, 'image': image, 'price': price};
  }

  @override
  String toString() {
    return 'Product{name: $name, id: $id, image: $image, price: $price}';
  }

  Product copyWith({String? name, String? id, String? image, double? price}) {
    return Product(
      name: name ?? this.name,
      id: id ?? this.id,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  static List<Product> products = [
    Product(id: "F01", name: "Apple", price: 20000),
    Product(id: "F02", name: "Orange", price: 30000),
    Product(id: "F03", name: "Banana", price: 15000),
    Product(id: "F04", name: "Mango", price: 50000),
    Product(id: "F05", name: "Watermelon", price: 35000),
    Product(id: "F06", name: "Grapes", price: 70000),
  ];
}