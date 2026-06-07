/// lib/models/movie.dart
/// Định nghĩa model Movie và dữ liệu mẫu cho ứng dụng duyệt phim.

// ---------------------------------------------------------------------------
// Lớp dữ liệu đại diện cho một bộ phim
// ---------------------------------------------------------------------------
class Movie {
  /// Tên phim
  final String title;

  /// Năm phát hành
  final int year;

  /// Danh sách thể loại (một phim có thể thuộc nhiều thể loại)
  final List<String> genres;

  /// URL ảnh poster (sử dụng ảnh placeholder từ picsum.photos)
  final String posterUrl;

  /// Điểm đánh giá (0.0 – 10.0)
  final double rating;

  const Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

// ---------------------------------------------------------------------------
// Dữ liệu mẫu (mock data) – danh sách các bộ phim
// Sử dụng picsum.photos với seed cố định để ảnh không thay đổi mỗi lần load
// ---------------------------------------------------------------------------
const List<Movie> allMovies = [
  Movie(
    title: 'Inception',
    year: 2010,
    genres: ['Sci-Fi', 'Thriller', 'Action'],
    posterUrl: 'https://picsum.photos/seed/inception/300/450',
    rating: 8.8,
  ),
  Movie(
    title: 'The Dark Knight',
    year: 2008,
    genres: ['Action', 'Drama', 'Thriller'],
    posterUrl: 'https://picsum.photos/seed/darkknight/300/450',
    rating: 9.0,
  ),
  Movie(
    title: 'Interstellar',
    year: 2014,
    genres: ['Sci-Fi', 'Drama', 'Adventure'],
    posterUrl: 'https://picsum.photos/seed/interstellar/300/450',
    rating: 8.6,
  ),
  Movie(
    title: 'The Grand Budapest Hotel',
    year: 2014,
    genres: ['Comedy', 'Drama', 'Adventure'],
    posterUrl: 'https://picsum.photos/seed/budapest/300/450',
    rating: 8.1,
  ),
  Movie(
    title: 'Parasite',
    year: 2019,
    genres: ['Drama', 'Thriller', 'Comedy'],
    posterUrl: 'https://picsum.photos/seed/parasite/300/450',
    rating: 8.5,
  ),
  Movie(
    title: 'Dune',
    year: 2021,
    genres: ['Sci-Fi', 'Adventure', 'Action'],
    posterUrl: 'https://picsum.photos/seed/dune2021/300/450',
    rating: 8.0,
  ),
];