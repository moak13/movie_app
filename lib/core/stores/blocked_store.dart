import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/blocked_model.dart';
import '../services/database_service.dart';

const String _blockedTable = 'blocked';

class BlockedStore {
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('BlockedStore');

  Stream<List<Blocked>> getStreamBlockedTitles() async* {
    _log.i('streaming blocked titles');
    List<Map<String, dynamic>> blockedResults =
        await _databaseService.database!.query(_blockedTable);
    yield blockedResults.map((e) => Blocked.fromJson(e)).toList();
  }

  Future<List<Blocked>> getBlockedTitles() async {
    _log.i('fetching blocked titles');
    List<Map<String, dynamic>> blockedResults =
        await _databaseService.database!.query(_blockedTable);
    return blockedResults.map((e) => Blocked.fromJson(e)).toList();
  }

  Future<void> addBlockedTitle({Blocked? title}) async {
    _log.i('adding blocked title');
    await _databaseService.database!.insert(_blockedTable, title!.toJson());
  }

  Future<void> removeBlockedTitle({Blocked? blockedMovie}) async {
    _log.i('removing blocked title');
    await _databaseService.database!.delete(_blockedTable,
        where: "Title = ?", whereArgs: [blockedMovie?.title]);
  }

  Future<bool> isBlocked({String? title}) async {
    _log.i('checking blocked state for $title');
    bool status = false;
    var records = await _databaseService.database!
        .query(_blockedTable, where: "Title = ?", whereArgs: [title]);
    if ((records).isEmpty) {
      status = false;
    } else {
      status = true;
    }
    return status;
  }
}
