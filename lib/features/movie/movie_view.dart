import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/movie_model.dart';
import '../../core/utils/size_manager.dart';
import 'view_model/movie_viewmodel.dart';
import 'widgets/action_button.dart';
import 'widgets/content_holder.dart';
import 'widgets/plot_holder.dart';

class MovieView extends StatelessWidget {
  final Movie? movie;
  const MovieView({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<MovieViewModel>.reactive(
      onModelReady: (model) async {
        await model.checkIsBlocked(movie: movie);
        await model.checkIsSaved(movie: movie);
      },
      viewModelBuilder: () => MovieViewModel(),
      builder: (
        BuildContext context,
        MovieViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              '${movie?.title}',
              style: theme.textTheme.titleLarge,
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: SizeMg.height(300),
                    width: SizeMg.screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${movie?.poster}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: SizeMg.height(10),
                    right: SizeMg.width(10),
                    child: Container(
                      height: SizeMg.height(25),
                      width: SizeMg.width(45),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          SizeMg.radius(10),
                        ),
                      ),
                      child: Text(
                        '${movie?.rated}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: SizeMg.screenWidth,
                height: SizeMg.height(70),
                color: Colors.grey,
                padding: EdgeInsets.only(
                  left: SizeMg.width(10),
                  right: SizeMg.width(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating:',
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: SizeMg.width(20),
                    ),
                    Container(
                      height: SizeMg.height(25),
                      width: SizeMg.width(45),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(
                          SizeMg.radius(10),
                        ),
                      ),
                      child: Text(
                        '${movie?.imdbRating}',
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeMg.height(10),
                  left: SizeMg.width(10),
                  right: SizeMg.width(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeMg.height(20),
                    ),
                    PlotHolder(
                      plot: movie?.plot,
                    ),
                    SizedBox(
                      height: SizeMg.height(50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContentHolder(
                              title: 'Type',
                              content: movie?.type,
                            ),
                            SizedBox(
                              height: SizeMg.height(10),
                            ),
                            ContentHolder(
                              title: 'Language',
                              content: movie?.language,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContentHolder(
                              title: 'Release',
                              content: movie?.released,
                            ),
                            SizedBox(
                              height: SizeMg.height(10),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeMg.height(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Builder(builder: (context) {
                          if (model.isSaved == true) {
                            ActionButton(
                              title: 'Unfavorite',
                              icon: Icons.favorite,
                              onTap: () {
                                model.actionUnsaveMovie(movie: movie);
                              },
                            );
                          }
                          return ActionButton(
                            title: 'Favorite',
                            icon: Icons.favorite_outline,
                            onTap: () {
                              model.actionSaveMovie(movie: movie);
                            },
                          );
                        }),
                        Builder(builder: (context) {
                          if (model.isBlocked == true) {
                            return ActionButton(
                              title: 'Unblock',
                              icon: Icons.circle_outlined,
                              onTap: () {
                                model.actionUnblockMovie(movie: movie);
                              },
                            );
                          }

                          return ActionButton(
                            title: 'Block',
                            icon: Icons.block,
                            onTap: () {
                              model.actionBlockMovie(movie: movie);
                            },
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
