import 'package:demowidget/Entity/Product.dart';

class ProductDAO {
  List<Product> l;

  ProductDAO(this.l);

  List<Product> getAllProduct() {
    return l;
  }

  void addProduct(Product p) {
    var index = l.indexWhere((element) => element.id == p.id);
    if (index < 0) {
      l.add(p);
    }
  }

  void deleteProduct(String id) {
    l.removeWhere((element) => element.id == id);
  }

  void updateProduct(Product pNew) {
    var index = l.indexWhere((element) => element.id == pNew.id);

    if (index >= 0) {
      l[index] = pNew;
    }
  }
}