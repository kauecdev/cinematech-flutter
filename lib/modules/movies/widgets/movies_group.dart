import 'package:cinematech/application/ui/widgets/movie_card.dart';
import 'package:cinematech/models/movie_model.dart';
import 'package:cinematech/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  final List<MovieModel> movies;
  const MoviesGroup({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 264,
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (content, index) {
                var movie = movies[index];
                return MovieCard(
                  movie: movie,
                  favoriteCallback: () => controller.favoriteMovie(movie),
                );
              },
            );
          }),
        )
      ]),
    );
  }
}
