import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../stores/blocked_store.dart';
import '../stores/movie_store.dart';

class InformationService with ReactiveServiceMixin {
  final _movieStore = locator<MovieStore>();
  final _blockedStore = locator<BlockedStore>();
  final _log = getLogger('InformationService');
  final _savedStatus = ReactiveValue<bool>(false);
  bool get savedStatus => _savedStatus.value;

  final _blockedStatus = ReactiveValue<bool>(false);
  bool get blockedStatus => _blockedStatus.value;

  Future<void> getSavedState({String? title}) async {
    _log.i('saved mixin triggered');
    var data = await _movieStore.isSaved(title: title);
    _log.i('saved(bool): $data');
    _savedStatus.value = data;
  }

  Future<void> getBlockedState({String? title}) async {
    _log.i('blocked mixin tiggered');
    var data = await _blockedStore.isBlocked(title: title);
    _log.i('blocked(bool): $data');
    _blockedStatus.value = data;
  }
}
