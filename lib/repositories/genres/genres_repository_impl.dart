import 'package:cinematech/application/rest_client/rest_client.dart';
import 'package:cinematech/models/genre_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : this._restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>('/genre/movie/list',
        query: {
          'api_key': RemoteConfig.instance.getString('api_token'),
          'language': 'pt-br'
        }, decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GenreModel>((genre) => GenreModel.fromMap(genre))
            .toList();
      }

      return <GenreModel>[];
    });

    if (result.hasError) {
      print(result.statusText);
      throw Exception("Erro ao buscar gêneros.");
    }

    return result.body ?? <GenreModel>[];
  }
}
