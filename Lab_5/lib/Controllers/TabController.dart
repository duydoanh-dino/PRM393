import 'package:flutter/material.dart';
import 'package:lab_5/Views/Pages/HomePage.dart';
import 'package:lab_5/Widgets/ProductWidget.dart';
import 'package:lab_5/Views/Pages/AboutPage.dart';


class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.info)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductListWidget(),
          const AboutPage(),
          const Center(child: Text("Detail")),
        ],
      ),
    );
  }
}