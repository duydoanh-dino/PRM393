import 'package:flutter/material.dart';

// ============================================================
// EXERCISE 1 – Core Widgets Demo
// Minh hoạ các widget cơ bản: Text, Icon, Image.network, Card
// ============================================================
class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1 – Core Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- Widget Text: tiêu đề lớn, đậm ---
          const Text(
            'Welcome to Flutter UI',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // --- Widget Icon: biểu tượng cuộn phim ---
          const Center(
            child: Icon(
              Icons.movie_creation,
              size: 64,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 16),

          // --- Widget Image.network: ảnh từ internet (Đã bọc qua Proxy sửa lỗi CORS Web) ---
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              // Đã cập nhật link ảnh FPT Hòa Lạc mới và bọc qua proxy wsrv.nl
              'https://wsrv.nl/?url=https://hoalac-school.fpt.edu.vn/wp-content/uploads/DJI_0008-1.jpeg',
              height: 200,
              fit: BoxFit.cover,
              // Hiển thị vòng tải khi ảnh đang load
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (_, __, ___) => const SizedBox(
                height: 200,
                child: Center(child: Icon(Icons.broken_image, size: 48)),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // --- Widget Card chứa ListTile ---
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              // Icon ngôi sao ở đầu
              leading: const Icon(Icons.star, color: Colors.amber),
              title: const Text('Movie Item'),
              subtitle: const Text('This is a sample ListTile inside a Card.'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}