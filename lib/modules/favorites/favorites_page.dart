import 'package:cinematech/application/ui/widgets/movie_card.dart';
import 'package:cinematech/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favorites'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map((movie) => MovieCard(
                        movie: movie,
                        favoriteCallback: () =>
                            controller.removeFavorite(movie),
                      ))
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
