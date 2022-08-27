import 'package:stacked/stacked.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/extensions/string_extenstion.dart';
import '../../../core/models/movie_model.dart';
import '../../../core/stores/blocked_store.dart';
import '../../../core/stores/movie_store.dart';

class MovieViewModel extends BaseViewModel {
  final _movieStore = locator<MovieStore>();
  final _blockedStore = locator<BlockedStore>();

  bool isBlocked = false;

  void actionStoreMovie({Movie? movie}) async {
    await _movieStore.addMovie(
      movie: movie,
    );
  }

  void actionBlockMovie({Movie? movie}) async {
    await _blockedStore.addBlockedTitle(
      movie: movie,
    );
  }

  void actionUnblockMovie({Movie? movie}) async {
    await _blockedStore.removeBlockedTitle(
      movie: movie,
    );
  }

  void checkIsBlocked({Movie? movie}) async {
    isBlocked = await _blockedStore.isBlocked(
      title: movie?.title?.capitalizeFirst,
    );
  }

  void checkIsSaved({Movie? movie}) {}
}
