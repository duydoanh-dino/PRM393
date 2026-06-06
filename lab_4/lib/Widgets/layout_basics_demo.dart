import 'package:flutter/material.dart';

// EXERCISE 3 – Layout Demo
// Danh sách phim mẫu dùng ListView.builder bên trong Column

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  // Dữ liệu mẫu danh sách phim
  static const List<String> _movies = [
    'Avatar',
    'Inception',
    'Interstellar',
    'Joker',
    'The Dark Knight',
    'Parasite',
    'Dune',
    'Oppenheimer',
    'Barbie',
    'Spider-Man',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3 – Layout Demo')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Tiêu đề lớn ở trên cùng ---
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Now Playing',
              style: theme.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          const SizedBox(height: 8),

          // Expanded giúp ListView chiếm phần còn lại của Column
          // mà không gây lỗi "unbounded height".
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                // Lấy chữ cái đầu tiên của tên phim làm avatar
                final initial = movie[0].toUpperCase();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      // CircleAvatar hiển thị chữ cái đầu tên phim
                      leading: CircleAvatar(
                        backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                        child: Text(
                          initial,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(movie),
                      subtitle: const Text('Sample description'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}