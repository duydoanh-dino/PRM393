/// lib/widgets/sort_dropdown.dart
/// Widget bộ chọn tiêu chí sắp xếp danh sách phim.

import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Danh sách các tiêu chí sắp xếp được hỗ trợ
// Khai báo dưới dạng hằng số để dùng chung toàn dự án
// ---------------------------------------------------------------------------
const List<String> kSortOptions = ['A–Z', 'Z–A', 'Year', 'Rating'];

// ---------------------------------------------------------------------------
// SortDropdown – StatelessWidget (trạng thái do màn hình cha quản lý)
// ---------------------------------------------------------------------------
class SortDropdown extends StatelessWidget {
  /// Giá trị tiêu chí sắp xếp đang được chọn
  final String selectedSort;

  /// Callback khi người dùng đổi sang tiêu chí khác
  final ValueChanged<String?> onChanged;

  const SortDropdown({
    super.key,
    required this.selectedSort,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Nhãn "Sort by:" phía trước dropdown
        Text(
          'Sort by:',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),

        // Bọc trong Container để custom viền bo góc
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: DropdownButtonHideUnderline(
            // Ẩn đường gạch chân mặc định của DropdownButton
            child: DropdownButton<String>(
              value: selectedSort,
              // Xây dựng đúng 4 lựa chọn từ danh sách hằng số
              items: kSortOptions
                  .map(
                    (option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
                  .toList(),
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              // Kích thước dropdown nhỏ gọn, không chiếm quá nhiều chiều rộng
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}