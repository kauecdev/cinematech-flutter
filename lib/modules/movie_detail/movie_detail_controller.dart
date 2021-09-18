import 'package:cinematech/application/ui/loader/loader_mixin.dart';
import 'package:cinematech/application/ui/messages/messages_mixin.dart';
import 'package:cinematech/models/movie_detail_model.dart';
import 'package:cinematech/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailTab = await _moviesService.getDetail(movieId);
      movie.value = movieDetailTab;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar detalhes do filme.'));
    }
  }
}
