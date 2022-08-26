import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/movie_model.dart';
import '../../core/utils/size_manager.dart';
import 'view_model/movie_viewmodel.dart';

class MovieView extends StatelessWidget {
  final Movie? movie;
  const MovieView({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return ViewModelBuilder<MovieViewModel>.reactive(
      viewModelBuilder: () => MovieViewModel(),
      builder: (
        BuildContext context,
        MovieViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${movie?.title}'),
          ),
          body: SafeArea(
            child: Column(
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
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeMg.height(10),
                    left: SizeMg.width(10),
                    right: SizeMg.width(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${movie?.title}'),
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
                            child: Text('${movie?.imdbRating}'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeMg.height(20),
                      ),
                      Container(
                        height: SizeMg.height(100),
                        width: SizeMg.screenWidth,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: SizeMg.width(5),
                          right: SizeMg.width(5),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(
                            SizeMg.radius(10),
                          ),
                        ),
                        child: Text(
                          '${movie?.plot}',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: SizeMg.height(30),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          model.actionStoreMovie(movie: movie);
                        },
                        icon: const Icon(Icons.favorite),
                        label: const Text('Favorite'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
