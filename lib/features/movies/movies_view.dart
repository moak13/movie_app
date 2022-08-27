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
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<MoviesViewModel>.reactive(
      viewModelBuilder: () => MoviesViewModel(),
      builder: (
        BuildContext context,
        MoviesViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Movies',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: SizeMg.text(50),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (model.data?.isEmpty == true || model.data == null) {
                      return Center(
                        child: Text(
                          'No Favorite movie(s) Saved.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        top: SizeMg.height(15),
                        left: SizeMg.width(5),
                        right: SizeMg.width(5),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: SizeMg.height(10),
                        crossAxisSpacing: SizeMg.width(5),
                        mainAxisExtent: SizeMg.height(230),
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
