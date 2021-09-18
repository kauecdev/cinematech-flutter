import 'package:cinematech/models/movie_detail_model.dart';
import 'package:cinematech/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> searchMovie(String movieName);
  Future<MovieDetailModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoritesMovies(String userId);
}
