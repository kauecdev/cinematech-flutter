import 'package:cinematech/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentProductionCredits extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContentProductionCredits({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5.0),
        child: RichText(
          text: TextSpan(
            text: 'Companhia(s) produtora(s): ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff222222)),
            children: [
              TextSpan(
                text: movie?.productionCompanies.join(', ') ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Color(0xff222222)),
              )
            ],
          ),
        ));
  }
}
