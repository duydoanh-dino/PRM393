/// lib/widgets/movie_card.dart
/// Widget hiển thị thẻ thông tin một bộ phim.
/// Dùng LayoutBuilder để tự điều chỉnh chiều cao ảnh poster theo chiều rộng thẻ.

import 'package:flutter/material.dart';
import '../models/movie.dart';

// ---------------------------------------------------------------------------
// MovieCard – StatelessWidget
// ---------------------------------------------------------------------------
class MovieCard extends StatelessWidget {
  /// Đối tượng phim cần hiển thị
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      // Bo góc và đổ bóng cho card
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias, // Ảnh không tràn ra ngoài bo góc
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------------------------------------------------------
          // Phần ảnh poster – dùng LayoutBuilder để tính chiều cao responsive
          // ---------------------------------------------------------------
          LayoutBuilder(
            builder: (context, constraints) {
              // Tỉ lệ poster chuẩn điện ảnh là 2:3 (width:height)
              // Chiều cao = chiều rộng hiện tại × 1.5
              final posterHeight = constraints.maxWidth * 1.5;

              return SizedBox(
                width: double.infinity,
                height: posterHeight,
                child: Image.network(
                  movie.posterUrl,
                  fit: BoxFit.cover,
                  // Widget hiển thị khi ảnh đang tải
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: colorScheme.surfaceContainerHighest,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                  // Widget hiển thị khi tải ảnh thất bại
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 48,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
              );
            },
          ),

          // ---------------------------------------------------------------
          // Phần thông tin phim bên dưới ảnh
          // ---------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tiêu đề phim
                Text(
                  movie.title,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Năm phát hành và điểm đánh giá trên cùng một dòng
                Row(
                  children: [
                    Text(
                      '${movie.year}',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Spacer(),
                    // Icon ngôi sao + điểm rating
                    Icon(Icons.star_rounded,
                        size: 14, color: Colors.amber.shade600),
                    const SizedBox(width: 2),
                    Text(
                      movie.rating.toStringAsFixed(1),
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.amber.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}