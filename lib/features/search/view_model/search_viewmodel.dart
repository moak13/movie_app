import 'package:dio/dio.dart';
import 'package:movie_app/core/enum/snack_bar_enum.dart';
import 'package:movie_app/core/stores/blocked_store.dart';
import 'package:movie_app/core/extensions/string_extenstion.dart';
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
  final _blockedStore = locator<BlockedStore>();

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
      _snackbarService.showCustomSnackBar(
        variant: SnackBarType.info,
        title: 'Info',
        message: 'Input a search query',
      );
      return;
    }

    if (StringUtil.isNotEmpty(title)) {
      final bool = await _blockedStore.isBlocked(title: title?.capitalizeFirst);
      _log.i('blocked: $bool');
      if (bool == true) {
        _snackbarService.showCustomSnackBar(
          variant: SnackBarType.info,
          title: 'Info',
          message:
              'The movie/show with the title: $title has been blocked by you.',
          duration: const Duration(seconds: 3),
        );

        return;
      }
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
