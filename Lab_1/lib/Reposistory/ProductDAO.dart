// ProductDAO.dart

import 'package:lab1/Product/Product.dart';

class ProductDAO {

  // lấy danh sách từ Product.dart
  List<Product> products = Product.productList;

  // them san pham
  void addProduct(Product product) {
    products.add(product);
  }

  // hien thi tat ca
  void showAll() {

    for (var p in products) {
      p.showInfo();
    }
  }

  // tim kiem theo ten
  void searchProduct(String keyword) {

    bool check = false;

    for (var p in products) {

      if (p.name.toLowerCase().contains(keyword.toLowerCase())) {

        p.showInfo();
        check = true;
      }
    }

    if (check == false) {
      print("Khong tim thay");
    }
  }

  // sap xep tang dan
  void sortUp() {

    products.sort((a, b) => a.price.compareTo(b.price));
  }

  // sap xep giam dan
  void sortDown() {

    products.sort((a, b) => b.price.compareTo(a.price));
  }

  // sua san pham
  void updateProduct(
      int id,
      String newName,
      String newImage,
      double newPrice) {

    for (var p in products) {

      if (p.id == id) {

        p.name = newName;
        p.image = newImage;
        p.price = newPrice;

        print("Da sua");
        return;
      }
    }

    print("Khong tim thay");
  }

  // xoa san pham
  void deleteProduct(int id) {

    for (int i = 0; i < products.length; i++) {

      if (products[i].id == id) {

        products.removeAt(i);

        print("Da xoa");
        return;
      }
    }

    print("Khong tim thay");
  }
}