/// lib/main.dart
/// Điểm khởi chạy ứng dụng Flutter – Lab 6: Responsive Movie Genre Browsing Screen.

import 'package:flutter/material.dart';
import 'screens/genre_screen.dart';

// ---------------------------------------------------------------------------
// Hàm main – entry point bắt buộc của mọi ứng dụng Flutter/Dart
// ---------------------------------------------------------------------------
void main() {
  runApp(const ResponsiveMovieApp());
}

// ---------------------------------------------------------------------------
// ResponsiveMovieApp – Widget gốc của ứng dụng
// Sử dụng MaterialApp để cung cấp theme, navigation và các tính năng Material
// ---------------------------------------------------------------------------
class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Browser',
      debugShowCheckedModeBanner: false,

      // ----- Light Theme -----
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A73E8), // Xanh dương làm màu chủ đạo
          brightness: Brightness.light,
        ),
        // Font mặc định của hệ thống – không cần package bên thứ ba
        fontFamily: null,
        cardTheme: const CardThemeData(
          elevation: 2,
          margin: EdgeInsets.zero,
        ),
      ),

      // ----- Dark Theme (tuỳ chọn hệ thống) -----
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A73E8),
          brightness: Brightness.dark,
        ),
        cardTheme: const CardThemeData(
          elevation: 2,
          margin: EdgeInsets.zero,
        ),
      ),

      // Tự động theo theme sáng/tối của thiết bị
      themeMode: ThemeMode.system,

      // Màn hình chính của ứng dụng
      home: const GenreScreen(),
    );
  }
}