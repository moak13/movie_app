import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/app/app.router.dart';
import '../../../core/models/movie_model.dart';
import '../../../core/stores/movie_store.dart';

class MoviesViewModel extends StreamViewModel<List<Movie>> {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _movieStore = locator<MovieStore>();
  final _log = getLogger('MoviesViewModel');

  @override
  Stream<List<Movie>> get stream => _movieStore.getStreamMovies();

  void actionRouteToMovie({Movie? movie}) {
    _log.i('navigation to movie');
    _navigationService.navigateToMovieView(
      movie: movie,
    );
  }

  @override
  void onError(error) {
    _snackbarService.showSnackbar(message: error);
    super.onError(error);
  }
}
