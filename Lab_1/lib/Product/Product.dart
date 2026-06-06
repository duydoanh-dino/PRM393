class Product {
  int id;
  String name;
  String image;
  double price;

  Product(this.id, this.name, this.image, this.price);

  static List<Product> productList = [];

  // hien thi 1 san pham
  void showInfo() {
    print("ID: $id");
    print("Name: $name");
    print("Image: $image");
    print("Price: $price");
    print("----------------");
  }

  // them
  static void addProduct(Product product) {
    productList.add(product);
  }

  // hien thi tat ca
  static void showAll() {
    for (var p in productList) {
      p.showInfo();
    }
  }

  // tim kiem
  static void searchProduct(String keyword) {
    bool check = false;

    for (var p in productList) {
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
  static void sortUp() {
    productList.sort((a, b) => a.price.compareTo(b.price));
  }

  // sap xep giam dan
  static void sortDown() {
    productList.sort((a, b) => b.price.compareTo(a.price));
  }

  // sua
  static void updateProduct(
      int id, String newName, String newImage, double newPrice) {

    for (var p in productList) {
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

  // xoa
  static void deleteProduct(int id) {

    for (int i = 0; i < productList.length; i++) {

      if (productList[i].id == id) {
        productList.removeAt(i);

        print("Da xoa");
        return;
      }
    }

    print("Khong tim thay");
  }
}