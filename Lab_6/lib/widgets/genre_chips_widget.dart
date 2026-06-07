/// lib/widgets/genre_chips_widget.dart
/// Widget hiển thị danh sách thể loại phim dưới dạng các chip có thể bật/tắt.
/// Dùng Wrap để tự động xuống dòng khi không đủ chỗ ngang.

import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// GenreChipsWidget – StatelessWidget (trạng thái do màn hình cha quản lý)
// ---------------------------------------------------------------------------
class GenreChipsWidget extends StatelessWidget {
  /// Toàn bộ danh sách thể loại để hiển thị
  final List<String> genres;

  /// Tập hợp các thể loại đang được chọn (có thể chọn nhiều cùng lúc)
  final Set<String> selectedGenres;

  /// Callback khi người dùng nhấn vào một chip:
  /// nếu đã chọn thì bỏ chọn, chưa chọn thì thêm vào.
  final ValueChanged<String> onGenreSelected;

  const GenreChipsWidget({
    super.key,
    required this.genres,
    required this.selectedGenres,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      // Khoảng cách giữa các chip theo chiều ngang và dọc
      spacing: 8,
      runSpacing: 6,
      children: genres.map((genre) {
        final isSelected = selectedGenres.contains(genre);

        return FilterChip(
          label: Text(
            genre,
            style: TextStyle(
              fontSize: 13,
              fontWeight:
              isSelected ? FontWeight.w600 : FontWeight.w400,
              // Chữ chip được chọn dùng màu nền để tạo contrast
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurface,
            ),
          ),
          selected: isSelected,
          // Màu nền khi chip được chọn
          selectedColor: colorScheme.primary,
          // Màu nền khi chip chưa được chọn
          backgroundColor: colorScheme.surfaceContainerHighest,
          // Xóa check icon mặc định của FilterChip
          showCheckmark: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              width: 1,
            ),
          ),
          onSelected: (_) => onGenreSelected(genre),
        );
      }).toList(),
    );
  }
}