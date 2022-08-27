import 'package:flutter/material.dart';

import '../../../core/models/movie_model.dart';
import '../../../core/utils/size_manager.dart';
import 'card_image.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  final VoidCallback? onTap;
  const MovieCard({
    Key? key,
    this.movie,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: SizeMg.height(230),
          width: SizeMg.width(200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(
              SizeMg.radius(5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardImage(
                imageUrl: '${movie?.poster}',
              ),
              SizedBox(
                height: SizeMg.height(5),
              ),
              Text(
                '${movie?.title}',
                softWrap: true,
                overflow: TextOverflow.fade,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(
                height: SizeMg.height(2),
              ),
              Text(
                '${movie?.plot}',
                textAlign: TextAlign.justify,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(
                height: SizeMg.height(5),
              ),
              Text(
                '${movie?.imdbRating}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
