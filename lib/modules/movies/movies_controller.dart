import 'package:cinematech/application/auth/auth_service.dart';
import 'package:cinematech/application/ui/messages/messages_mixin.dart';
import 'package:cinematech/models/genre_model.dart';
import 'package:cinematech/models/movie_model.dart';
import 'package:cinematech/services/genres/genres_service.dart';
import 'package:cinematech/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  MoviesController(
      {required GenresService genresService,
      required MoviesService moviesService,
      required AuthService authService})
      : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      await getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da página'));
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRatedMovies();
      final favoriteMoviesData = await getFavorites();

      popularMoviesData = popularMoviesData.map((movie) {
        if (favoriteMoviesData.containsKey(movie.id)) {
          return movie.copyWith(favorite: true);
        } else {
          return movie.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((movie) {
        if (favoriteMoviesData.containsKey(movie.id)) {
          return movie.copyWith(favorite: true);
        } else {
          return movie.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;

      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da página'));
    }
  }

  void filterByName(String title) async {
    if (title.isNotEmpty) {
      final searchedMovies = await _moviesService.searchMovie(title);

      popularMovies.assignAll(searchedMovies);
      topRatedMovies.assignAll(searchedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    var genreFilter = genreModel;

    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }

    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;

    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritesMovies(user.uid);

      return <int, MovieModel>{
        for (var favorite in favorites) favorite.id: favorite
      };
    }

    return {};
  }
}
