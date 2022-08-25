import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/movie_model.dart';
import 'view_model/movie_viewmodel.dart';

class MovieView extends StatelessWidget {
  final Movie? movie;
  const MovieView({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieViewModel>.reactive(
      viewModelBuilder: () => MovieViewModel(),
      builder: (
        BuildContext context,
        MovieViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Movie View',
            ),
          ),
        );
      },
    );
  }
}
