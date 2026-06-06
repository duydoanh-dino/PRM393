import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page"),
        backgroundColor: Colors.pink[200],
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context); // Quay lại HomePage
        //   },
        //   icon: const Icon(Icons.home),
        // ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 50,
            ),
            SizedBox(height: 20),
            Text(
              "Hong Phuoc",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}