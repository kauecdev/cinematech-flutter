import 'package:cinematech/application/rest_client/rest_client.dart';
import 'package:cinematech/models/movie_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print("Erro ao buscar filmes populares [${result.statusText}]");
      throw Exception("Erro ao busca filmes populares.");
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print("Erro ao buscar filmes populares [${result.statusText}]");
      throw Exception("Erro ao busca filmes populares.");
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> searchMovie(String movieName) async {
    final result = await _restClient.get<List<MovieModel>>(
      '/search/movie',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'query': movieName,
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        print(data);

        final results = data['results'];

        if (results != null) {
          return results
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print("Erro ao buscar filme [${result.statusText}]");
      throw Exception("Erro ao busca filme.");
    }

    return result.body ?? <MovieModel>[];
  }
}
