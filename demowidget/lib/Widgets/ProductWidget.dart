import 'package:flutter/material.dart';
import 'package:demowidget/Entity/Product.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({super.key});

  var products = Product.products;

  @override
  Widget build(BuildContext context) {
    return ReponsiveProduct(products: products);
  }
}
class ReponsiveProduct extends StatelessWidget{
  List<Product> products;
  ReponsiveProduct({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width<450?1:2,
      // children: [for(int i=0;i<products.length;i++)
      //   Productwidget(product: products[i])],
      children: products
          .map((product) => Productwidget(product: product))
          .toList(),
    );
  }
}
class OneColumnProduct extends StatelessWidget{
  List<Product> products;
  OneColumnProduct({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < 5; i++) Productwidget(product: products[i]),
      ],
    );
  }
}

class Productwidget extends StatefulWidget {
  Product product;

  Productwidget({super.key, required this.product});

  @override
  State<Productwidget> createState() => _ProductwidgetState();
}

class _ProductwidgetState extends State<Productwidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width<400?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width/2,
        height: 500,
        //decoration: BoxDecoration(border: Border.all(width: 3, color: Colors.purpleAccent)),
        child: Column(
          children: [
            //Product Image
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                height: 700,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 700,
                      child: Image.asset(
                        'assets/images/phuoc.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: Text("Add to cart"),
                          icon: Icon(Icons.shopping_cart),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Product name, price, like
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Product Name: ${widget.product.name}"),

                        Text("Price: ${widget.product.price}\$"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _count++;
                        });
                      },
                      icon: Icon(
                        Icons.plus_one,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Text(_count.toString())),
                ],

              ),
            ),
            //List Icons
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 1; i <= 5; i++)
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //Product Description
            Expanded(
              flex: 3,

              child: Card(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Con chó là loài động vật gần gũi và trung thành với con người. "
                          "Chúng có bộ lông mềm mại, đôi mắt lanh lợi. "
                          "Chó không chỉ giúp trông nhà mà còn là người bạn thân thiết của nhiều"
                          " gia đìnhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                          "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                          "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                          "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  class ProductContainer extends StatelessWidget{
    ProductContainer({supper.key});
  @override
  Widget build(BuildContext context) {
  return Padding(
  padding: const EdgeInsets.all(10),
  child: Container(
  width: MediaQuery.of(context).size.width<400?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width/2,
  height: 500,
  //decoration: BoxDecoration(border: Border.all(width: 3, color: Colors.purpleAccent)),
  child: Column(
  children: [
  //Product Image
  Expanded(
  flex: 7,
  child: Container(
  width: double.infinity,
  height: 700,
  child: Stack(
  children: [
  Container(
  width: double.infinity,
  height: 700,
  child: Image.asset(
  'assets/images/phuoc.jpg',
  fit: BoxFit.fill,
  ),
  ),
  Align(
  alignment: Alignment.bottomRight,
  child: Padding(
  padding: const EdgeInsets.all(20),
  child: FloatingActionButton.extended(
  onPressed: () {},
  label: Text("Add to cart"),
  icon: Icon(Icons.shopping_cart),
  ),
  ),
  ),
  ],
  ),
  ),
  ),

  // Product name, price, like
  Expanded(
  flex: 2,
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Expanded(
  flex: 8,
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  Text("Product Name: ${widget.product.name}"),

  Text("Price: ${widget.product.price}\$"),
  ],
  ),
  ),
  Expanded(
  flex: 1,
  child: IconButton(
  onPressed: () {
  setState(() {
  _count++;
  });
  },
  icon: Icon(
  Icons.plus_one,
  color: Colors.yellow,
  fontWeight: FontWeight.bold,
  ),
  ),
  ),
  Expanded(flex: 1, child: Text(_count.toString())),
  ],

  ),
  ),
  //List Icons
  Expanded(
  flex: 1,
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  for (int i = 1; i <= 5; i++)
  Icon(
  Icons.star,
  color: Colors.yellow,
  fontWeight: FontWeight.bold,
  ),
  ],
  ),
  ),
  SizedBox(height: 10),
  //Product Description
  Expanded(
  flex: 3,

  child: Card(
  child: SingleChildScrollView(
  child: Padding(
  padding: const EdgeInsets.all(10),
  child: Text(
  "Con chó là loài động vật gần gũi và trung thành với con người. "
  "Chúng có bộ lông mềm mại, đôi mắt lanh lợi. "
  "Chó không chỉ giúp trông nhà mà còn là người bạn thân thiết của nhiều"
  " gia đìnhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
  "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
  "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
  "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
  ),
  ),
  ),
  ),
  ),
  ],
  ),
  ),
  );
  }
  }
}
