import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/movie_model.dart';
import '../../core/utils/size_manager.dart';
import 'view_model/movies_viewmodel.dart';
import 'widgets/movie_card.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return ViewModelBuilder<MoviesViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      viewModelBuilder: () => MoviesViewModel(),
      builder: (
        BuildContext context,
        MoviesViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: SizeMg.height(100),
                color: Colors.yellow,
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (model.data?.isEmpty == true || model.data == null) {
                      return const Center(
                        child: Text('No Favorite movie(s) Saved.'),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: model.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Movie? movie = model.data?.elementAt(index);
                        return MovieCard(
                          movie: movie,
                          onTap: () {
                            model.actionRouteToMovie(movie: movie);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
