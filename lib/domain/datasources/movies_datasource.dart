import 'package:cinemapedia_220186/domain/entities/movie.dart';


abstract class MoviesDatasource {

  Future<List<Movie>> getNowPlaying({ int page = 1 });

}