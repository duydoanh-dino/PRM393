import 'package:flutter/material.dart';
import '../main.dart'; // Import để truy cập AppState gốc điều khiển ThemeMode toàn cục

// EXERCISE 4 – App Structure & Theme
// Scaffold đầy đủ với AppBar, Body, FAB, và Dark Mode toggle

class AppStructureTheme extends StatefulWidget {
  const AppStructureTheme({super.key});

  @override
  State<AppStructureTheme> createState() => _AppStructureThemeState();
}

class _AppStructureThemeState extends State<AppStructureTheme> {
  // Trạng thái local để đồng bộ hiển thị Switch trên AppBar
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar với Switch toggle Dark Mode ─────────────────
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          // Nhãn "Dark"
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Center(child: Text('Dark')),
          ),
          // Switch ở góc phải AppBar
          Switch(
            value: _isDark,
            onChanged: (val) {
              setState(() => _isDark = val);
              // Gọi AppState.of() để thay đổi themeMode toàn ứng dụng
              AppState.of(context).toggleTheme(val);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      // ── Body ────────────────────────────────────────────────
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'This is a simple screen with theme toggle.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),

      // ── FloatingActionButton ────────────────────────────────
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FAB pressed!')),
          );
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}