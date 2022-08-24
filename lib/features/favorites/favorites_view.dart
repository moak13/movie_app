import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/favorites_viewmodel.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoritesViewModel>.reactive(
      viewModelBuilder: () => FavoritesViewModel(),
      builder: (
        BuildContext context,
        FavoritesViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Favorites View',
            ),
          ),
        );
      },
    );
  }
}
