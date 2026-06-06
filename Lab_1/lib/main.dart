// main.dart

import 'Product/Product.dart';
import 'Reposistory/ProductDAO.dart';

void main() {

  ProductDAO dao = ProductDAO();

  // thêm điện thoại
  dao.addProduct(Product(1, "iPhone 15", "iphone15.png", 1200));
  dao.addProduct(Product(2, "Samsung S24", "s24.png", 1100));
  dao.addProduct(Product(3, "Xiaomi 14", "xiaomi14.png", 900));
  dao.addProduct(Product(4, "Oppo Reno 12", "reno12.png", 750));

  print("Danh sach ban dau");
  dao.showAll();

  print("------------------");

  print("Tim kiem Apple");
  dao.searchProduct("apple");

  print("------------------");

  print("Sap xep tang dan");
  dao.sortUp();
  dao.showAll();

  print("------------------");

  print("Sua san pham");
  dao.updateProduct(2, "Green Apple", "greenapple.png", 25);
  dao.showAll();

  print("------------------");

  print("Xoa san pham");
  dao.deleteProduct(1);
  dao.showAll();
}