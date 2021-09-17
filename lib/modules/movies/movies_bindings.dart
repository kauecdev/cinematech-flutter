import 'package:cinematech/modules/movies/movies_controller.dart';
import 'package:cinematech/repositories/genres/genres_repository.dart';
import 'package:cinematech/repositories/genres/genres_repository_impl.dart';
import 'package:cinematech/services/genres/genres_service.dart';
import 'package:cinematech/services/genres/genres_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()));
    Get.lazyPut(() => MoviesController(genresService: Get.find()));
  }
}
