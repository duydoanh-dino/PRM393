import 'package:demowidget/Views/Pages/AboutPage.dart';
import 'package:flutter/material.dart';
import 'package:demowidget/Widgets/ProductWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  AboutOnPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
    );
  }

  void onPress() {}

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.pink[100],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "Products"),
            Tab(icon: Icon(Icons.person), text: "About"),
            Tab(icon: Icon(Icons.info), text: "Detail"),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
          icon: const Icon(Icons.account_box_outlined),
        ),
        actions: [IconButton(onPressed: onPress, icon: Icon(Icons.search))],
      ),
      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: double.infinity,
      //   child: Image.asset("assets/images/phuoc.jpg", fit: BoxFit.contain,),
      //
      // ),
      body: [
        ProductListWidget(),
        Center(child: Text("About")),
        Center(child: Text("Detail product")),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: "About",
            icon: Icon(Icons.account_box_outlined, color: Colors.purple),
          ),
          BottomNavigationBarItem(
            label: "Detail product",
            icon: Icon(Icons.details, color: Colors.pink),
          ),
        ],
      ),
      // body: SafeArea(
      //   child: RichText(
      //     text: TextSpan(
      //       text: "Hello ",
      //       style: TextStyle(
      //         color: Colors.deepPurple,
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),
      //       children: [
      //         TextSpan(
      //           text: "Phuoc ",
      //           style: TextStyle(
      //             color: Colors.blue,
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
