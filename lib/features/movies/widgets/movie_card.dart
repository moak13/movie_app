import 'package:flutter/material.dart';

import '../../../core/models/movie_model.dart';
import '../../../core/utils/size_manager.dart';
import '../../../core/utils/string_util.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  final VoidCallback? onTap;
  const MovieCard({Key? key, this.movie, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            children: [
              Builder(builder: (context) {
                if (StringUtil.isNotEmpty(movie?.poster)) {
                  return Container(
                    height: SizeMg.height(40),
                    width: SizeMg.width(40),
                    color: Colors.red,
                  );
                }
                return Container(
                  height: SizeMg.height(40),
                  width: SizeMg.width(40),
                  color: Colors.yellow,
                );
              }),
              Text('${movie?.title}'),
              SizedBox(
                height: SizeMg.height(2),
              ),
              FittedBox(
                child: Text('${movie?.plot}'),
              ),
              SizedBox(
                height: SizeMg.height(5),
              ),
              Text('${movie?.rated}'),
            ],
          ),
        ),
      ),
    );
  }
}
