import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/movies_viewmodel.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoviesViewModel>.reactive(
      viewModelBuilder: () => MoviesViewModel(),
      builder: (
        BuildContext context,
        MoviesViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Movies View',
            ),
          ),
        );
      },
    );
  }
}
