import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/app/app.router.dart';
import '../../../core/extensions/dio_error_extension.dart';
import '../../../core/models/movie_model.dart';
import '../../../core/services/data_connection_service.dart';
import '../../../core/services/movie_service.dart';
import '../../../core/utils/string_util.dart';

class SearchViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _connectionService = locator<DataConnectionService>();
  final _movieService = locator<MovieService>();

  Movie? movie;

  final _log = getLogger("SearchViewModel");

  String? _searchText = '';
  String? get searchText => _searchText;

  void actionSetTitle(String? title) {
    _searchText = title;
    notifyListeners();
  }

  Future<void> actionSearchMovie({String? title}) async {
    _log.i('fetching movie: $title');
    if (StringUtil.isEmpty(title)) {
      _snackbarService.showSnackbar(message: 'Input a search query');
      return;
    }
    setBusy(true);
    notifyListeners();
    try {
      movie = await _movieService.getMovieByTitle(title: title);
      _navigationService.navigateToMovieView(
        movie: movie,
      );
      setBusy(false);
      notifyListeners();
    } on DioError catch (e) {
      _log.e('dio catch state triggered');
      setBusy(false);
      _snackbarService.showSnackbar(message: '${e.errorMessage}');
      notifyListeners();
    } catch (e) {
      _log.e('catch state triggered');
      setBusy(false);
      _snackbarService.showSnackbar(message: e.toString());
      notifyListeners();
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
