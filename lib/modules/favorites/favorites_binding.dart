import 'package:cinematech/modules/favorites/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController(
        moviesService: Get.find(), authService: Get.find()));
  }
}
