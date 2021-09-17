import 'package:cinematech/models/genre_model.dart';
import 'package:cinematech/repositories/genres/genres_repository.dart';

import './genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  GenresServiceImpl({required GenresRepository genresRepository})
      : this._genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
