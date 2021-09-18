import 'package:cinematech/application/auth/auth_service.dart';
import 'package:cinematech/application/rest_client/rest_client.dart';
import 'package:cinematech/repositories/login/login_repository.dart';
import 'package:cinematech/repositories/login/login_repository_impl.dart';
import 'package:cinematech/repositories/movies/movies_repository.dart';
import 'package:cinematech/repositories/movies/movies_repository_impl.dart';
import 'package:cinematech/services/login/login_service.dart';
import 'package:cinematech/services/login/login_service_impl.dart';
import 'package:cinematech/services/movies/movies_service.dart';
import 'package:cinematech/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
    Get.put(AuthService()).init();
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()));
  }
}
