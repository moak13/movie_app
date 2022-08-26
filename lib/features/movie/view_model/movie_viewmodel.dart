import 'package:stacked/stacked.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/models/movie_model.dart';
import '../../../core/stores/movie_store.dart';

class MovieViewModel extends BaseViewModel {
  final _movieStore = locator<MovieStore>();

  void actionStoreMovie({Movie? movie}) async {
    _movieStore.addMovie(movie: movie);
  }
}
