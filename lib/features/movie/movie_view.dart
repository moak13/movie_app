import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/movie_viewmodel.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

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
