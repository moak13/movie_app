import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/enum/snack_bar_enum.dart';
import '../../../core/extensions/string_extenstion.dart';
import '../../../core/models/movie_model.dart';
import '../../../core/stores/blocked_store.dart';
import '../../../core/stores/movie_store.dart';

class MovieViewModel extends MultipleStreamViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _movieStore = locator<MovieStore>();
  final _blockedStore = locator<BlockedStore>();

  bool isBlocked = false;
  bool isSaved = false;

  void actionSaveMovie({Movie? movie}) async {
    if (await checkIsSaved(movie: movie) == true) {
      return _snackbarHandler(
        message: 'Movie with title: ${movie?.title} has already been saved',
        title: 'Error',
        variant: SnackBarType.error,
      );
    }
    await _movieStore.addMovie(
      movie: movie,
    );
    _snackbarHandler(
      message: 'Movie with title: ${movie?.title} has been saved',
      title: 'Info',
      variant: SnackBarType.info,
    );
  }

  void actionUnsaveMovie({Movie? movie}) async {
    await _movieStore.removeMovie(
      movie: movie,
    );
    _snackbarHandler(
      message: 'Movie with title: ${movie?.title} has been saved',
      title: 'Info',
      variant: SnackBarType.info,
    );
  }

  void actionBlockMovie({Movie? movie}) async {
    if (await checkIsBlocked(movie: movie) == true) {
      return _snackbarHandler(
        message: 'Movie with title: ${movie?.title} has already been blocked',
        title: 'Error',
        variant: SnackBarType.error,
      );
    }
    await _blockedStore.addBlockedTitle(
      movie: movie,
    );
    _snackbarHandler(
      message: 'Movie with title: ${movie?.title} has been blocked',
      title: 'Info',
      variant: SnackBarType.info,
    );
  }

  void actionUnblockMovie({Movie? movie}) async {
    await _blockedStore.removeBlockedTitle(
      movie: movie,
    );
    _snackbarHandler(
      message: 'Movie with title: ${movie?.title} has been unblocked',
      title: 'Info',
      variant: SnackBarType.info,
    );
  }

  Future<bool> checkIsBlocked({Movie? movie}) async {
    isBlocked = await _blockedStore.isBlocked(
      title: movie?.title?.capitalizeFirst,
    );
    return isBlocked;
  }

  Future<bool> checkIsSaved({Movie? movie}) async {
    isSaved = await _movieStore.isSaved(
      title: movie?.title?.capitalizeFirst,
    );
    return isSaved;
  }

  void _snackbarHandler({
    dynamic variant,
    required String message,
    required String title,
  }) {
    _snackbarService.showCustomSnackBar(
      message: message,
      variant: variant,
      title: title,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  // TODO: implement streamsMap
  Map<String, StreamData> get streamsMap => {};
}
