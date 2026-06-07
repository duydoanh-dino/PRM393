/// lib/screens/genre_screen.dart
/// Màn hình chính của ứng dụng: tìm kiếm, lọc theo thể loại, sắp xếp và
/// hiển thị danh sách phim dạng list (phone) hoặc grid (tablet/web).

import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/genre_chips_widget.dart';
import '../widgets/sort_dropdown.dart';
import '../widgets/movie_card.dart';

// ---------------------------------------------------------------------------
// GenreScreen – StatefulWidget (quản lý toàn bộ trạng thái bộ lọc & sắp xếp)
// ---------------------------------------------------------------------------
class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  // Từ khóa tìm kiếm hiện tại (chuỗi rỗng = không lọc)
  String _searchQuery = '';

  // Tập hợp các thể loại đang được chọn để lọc (rỗng = hiện tất cả)
  final Set<String> _selectedGenres = {};

  // Tiêu chí sắp xếp hiện tại
  String _selectedSort = 'A–Z';

  // -------------------------------------------------------------------------
  // Trích xuất tất cả thể loại duy nhất từ danh sách phim mẫu
  // Chạy một lần, dùng getter để giữ code gọn
  // -------------------------------------------------------------------------
  List<String> get _allGenres {
    final genres = <String>{};
    for (final movie in allMovies) {
      genres.addAll(movie.genres);
    }
    // Sắp xếp A-Z để chip hiển thị nhất quán
    return genres.toList()..sort();
  }

  // -------------------------------------------------------------------------
  // Xử lý khi người dùng nhấn toggle một chip thể loại:
  // – Đã chọn → bỏ chọn
  // – Chưa chọn → thêm vào tập
  // -------------------------------------------------------------------------
  void _toggleGenre(String genre) {
    setState(() {
      if (_selectedGenres.contains(genre)) {
        _selectedGenres.remove(genre);
      } else {
        _selectedGenres.add(genre);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // -----------------------------------------------------------------------
    // BƯỚC 1: Lọc danh sách phim theo từ khóa tìm kiếm (không phân biệt HOA/thường)
    // -----------------------------------------------------------------------
    final query = _searchQuery.toLowerCase().trim();

    List<Movie> visibleMovies = allMovies.where((movie) {
      // Lọc theo tiêu đề (case-insensitive)
      final matchesSearch =
          query.isEmpty || movie.title.toLowerCase().contains(query);

      // Lọc theo thể loại: phim phải có ít nhất 1 thể loại trùng với tập đang chọn
      // Nếu chưa chọn thể loại nào thì hiện tất cả
      final matchesGenre = _selectedGenres.isEmpty ||
          movie.genres.any((g) => _selectedGenres.contains(g));

      return matchesSearch && matchesGenre;
    }).toList();

    // -----------------------------------------------------------------------
    // BƯỚC 2: Sắp xếp danh sách đã lọc theo tiêu chí được chọn
    // -----------------------------------------------------------------------
    switch (_selectedSort) {
      case 'A–Z':
        visibleMovies.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Z–A':
        visibleMovies.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Year':
      // Phim mới nhất lên trên
        visibleMovies.sort((a, b) => b.year.compareTo(a.year));
        break;
      case 'Rating':
      // Điểm cao nhất lên trên
        visibleMovies.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }

    // -----------------------------------------------------------------------
    // BƯỚC 3: Dựng giao diện
    // -----------------------------------------------------------------------
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----- Tiêu đề màn hình -----
              Text(
                'Find a Movie',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),

              // ----- Thanh tìm kiếm -----
              SearchBarWidget(
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
              const SizedBox(height: 14),

              // ----- Chip lọc thể loại -----
              GenreChipsWidget(
                genres: _allGenres,
                selectedGenres: _selectedGenres,
                onGenreSelected: _toggleGenre,
              ),
              const SizedBox(height: 12),

              // ----- Hàng thông tin số lượng kết quả + dropdown sắp xếp -----
              Row(
                children: [
                  Text(
                    '${visibleMovies.length} result${visibleMovies.length != 1 ? 's' : ''}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  SortDropdown(
                    selectedSort: _selectedSort,
                    onChanged: (value) {
                      if (value != null) setState(() => _selectedSort = value);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // ----- Danh sách phim – responsive -----
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Xử lý trường hợp không có kết quả
                    if (visibleMovies.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.movie_filter_outlined,
                                size: 64,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                            const SizedBox(height: 12),
                            Text(
                              'No movies found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // ---------------------------------------------------
                    // Breakpoint:
                    //   < 800px  → Phone  → ListView (1 cột)
                    //   ≥ 800px  → Tablet/Web → GridView (2 cột)
                    // ---------------------------------------------------
                    if (constraints.maxWidth < 800) {
                      // Phone: danh sách 1 cột
                      return ListView.separated(
                        itemCount: visibleMovies.length,
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                        itemBuilder: (context, index) => MovieCard(
                          movie: visibleMovies[index],
                        ),
                      );
                    } else {
                      // Tablet / Web: lưới 2 cột
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        // childAspectRatio tính dựa trên tỉ lệ poster 2:3
                        // cộng thêm phần thông tin phía dưới (~80px)
                        childAspectRatio: 0.58,
                        children: visibleMovies
                            .map((movie) => MovieCard(movie: movie))
                            .toList(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}