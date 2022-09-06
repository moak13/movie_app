import 'package:flutter/material.dart';

import '../../movies/movies_view.dart';
import '../../search/search_view.dart';

class GetIndexView extends StatelessWidget {
  final int? index;
  const GetIndexView({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const MoviesView();
      case 1:
        return SearchView();
      default:
        return const MoviesView();
    }
  }
}
