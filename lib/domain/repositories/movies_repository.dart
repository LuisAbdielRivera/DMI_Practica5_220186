import 'package:cinemapedia_220186/domain/entities/movie.dart';


abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1 });
  Future<List<Movie>> getPopular({ int page = 1 });
  Future<List<Movie>> getUpComing({ int page = 1 });
  Future<List<Movie>> getTopRated({ int page = 1 });
  Future<List<Movie>> getMexicanMovies({ int page = 1 });

}