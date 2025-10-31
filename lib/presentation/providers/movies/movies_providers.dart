import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220186/domain/entities/movie.dart';
import 'package:cinemapedia_220186/presentation/providers/movies/movies_repository_provider.dart';
// 🔹 Tipo de función para obtener películas
typedef MovieCallback = Future<List<Movie>> Function({int page});
// 🔹 Provider para Now Playing
final nowPlayingMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((ref) => ref.watch(movieRepositoryProvider).getNowPlaying),
);
// 🔹 Provider para Popular Movies

final popularMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((ref) => ref.watch(movieRepositoryProvider).getPopular),

);

final upComingMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((ref) => ref.watch(movieRepositoryProvider).getUpComing),
);

final topRatedMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((ref) => ref.watch(movieRepositoryProvider).getTopRated),
);

final mexicanMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((ref) => ref.watch(movieRepositoryProvider).getMexicanMovies),
);

// 🔹 Notifier genérico que maneja cualquier tipo de lista de películas

class MoviesNotifier extends Notifier<List<Movie>> {
  final MovieCallback Function(Ref ref) _callbackBuilder;
  late final MovieCallback fetchMoreMovies;
  MoviesNotifier(this._callbackBuilder);
  int currentPage = 0;
  bool isLoading = false;
  @override
  List<Movie> build() {
    fetchMoreMovies = _callbackBuilder(ref);
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

}