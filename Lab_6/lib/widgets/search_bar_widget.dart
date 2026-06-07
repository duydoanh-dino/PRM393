/// lib/widgets/search_bar_widget.dart
/// Widget thanh tìm kiếm có bo góc và icon kính lúp.

import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// SearchBarWidget – StatefulWidget để quản lý trạng thái của TextEditingController
// ---------------------------------------------------------------------------
class SearchBarWidget extends StatefulWidget {
  /// Callback được gọi mỗi khi nội dung ô nhập thay đổi.
  /// Màn hình cha sẽ dùng giá trị này để lọc danh sách phim.
  final ValueChanged<String> onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  // Controller để đọc / xóa nội dung TextField
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // Giải phóng bộ nhớ khi widget bị hủy
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Bo góc và thêm đổ bóng nhẹ cho thanh tìm kiếm
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        // Mỗi lần gõ thì gọi callback truyền lên màn hình cha
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Search movies...',
          // Icon kính lúp ở đầu ô nhập
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          // Nút X để xóa nhanh nội dung tìm kiếm
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _controller,
            builder: (context, value, _) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  _controller.clear();
                  // Thông báo cho màn hình cha rằng ô tìm kiếm đã trống
                  widget.onChanged('');
                },
              );
            },
          ),
          // Xóa đường viền mặc định của TextField
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}