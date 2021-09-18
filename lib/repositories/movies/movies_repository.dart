import 'package:cinematech/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> searchMovie(String movieName);
}
