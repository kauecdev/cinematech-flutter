import 'package:cinematech/models/movie_model.dart';
import 'package:cinematech/repositories/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRatedMovies() =>
      _moviesRepository.getTopRatedMovies();

  @override
  Future<List<MovieModel>> searchMovie(String movieName) =>
      _moviesRepository.searchMovie(movieName);
}
