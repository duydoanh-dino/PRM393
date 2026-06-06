
// Lab 4: Flutter UI Fundamentals
// Gồm 5 màn hình bài tập được điều hướng từ HomeScreen.


import 'package:flutter/material.dart';

// Import 5 file bài tập nằm trong thư mục con Widgets
import 'Widgets/core_widgets_demo.dart';
import 'Widgets/input_controls_demo.dart';
import 'Widgets/layout_basics_demo.dart';
import 'Widgets/app_structure_theme.dart';
import 'Widgets/common_ui_fixes.dart'; // Chứa class CommonFixesDemo

void main() {
  // Khởi chạy ứng dụng, bọc trong AppState để quản lý themeMode toàn cục
  runApp(const AppState());
}

// ============================================================
// AppState: StatefulWidget ở mức gốc để quản lý ThemeMode
// toàn ứng dụng (dùng cho Exercise 4 toggle Dark Mode).
// ============================================================
class AppState extends StatefulWidget {
  const AppState({super.key});

  // Static method để truy cập AppState từ bất kỳ đâu trong cây widget
  static _AppStateState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppStateState>()!;
  }

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  // Mặc định sử dụng light mode
  ThemeMode _themeMode = ThemeMode.light;

  /// Hàm toggle theme, được gọi từ Exercise 4
  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 – Flutter UI',
      debugShowCheckedModeBanner: false,
      // Cấu hình Material Design 3
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// HomeScreen: Màn hình chính hiển thị menu điều hướng
// tới 5 bài tập dưới dạng Card / ListTile.
// ============================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Danh sách các bài tập: tiêu đề, icon, màu sắc, widget đích
  static final List<_ExerciseItem> _exercises = [
    _ExerciseItem(
      title: 'Exercise 1',
      subtitle: 'Core Widgets Demo',
      icon: Icons.widgets_outlined,
      color: Colors.blue,
      destination: const CoreWidgetsDemo(),
    ),
    _ExerciseItem(
      title: 'Exercise 2',
      subtitle: 'Input Controls Demo',
      icon: Icons.tune_outlined,
      color: Colors.green,
      destination: const InputControlsDemo(),
    ),
    _ExerciseItem(
      title: 'Exercise 3',
      subtitle: 'Layout Demo',
      icon: Icons.view_list_outlined,
      color: Colors.orange,
      destination: const LayoutDemo(),
    ),
    _ExerciseItem(
      title: 'Exercise 4',
      subtitle: 'App Structure & Theme',
      icon: Icons.palette_outlined,
      color: Colors.purple,
      destination: const AppStructureTheme(),
    ),
    _ExerciseItem(
      title: 'Exercise 5',
      subtitle: 'Common UI Fixes',
      icon: Icons.build_outlined,
      color: Colors.red,
      destination: const CommonFixesDemo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _exercises.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = _exercises[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              // Icon bài tập với màu nền tròn
              leading: CircleAvatar(
                backgroundColor: item.color.withOpacity(0.15),
                child: Icon(item.icon, color: item.color),
              ),
              title: Text(
                item.title,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              // Điều hướng sang màn hình bài tập tương ứng
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.destination),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Model đơn giản chứa thông tin hiển thị từng bài tập trong menu
class _ExerciseItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget destination;

  const _ExerciseItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.destination,
  });
}