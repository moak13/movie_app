import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/movie_model.dart';
import '../services/database_service.dart';

const String _blockedTable = 'blocked';

class BlockedStore {
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('BlockedStore');

  Stream<List<Movie>> getStreamBlockedTitles() async* {
    _log.i('streaming blocked titles');
    List<Map<String, dynamic>> blockedResults =
        await _databaseService.database!.query(_blockedTable);
    yield blockedResults.map((e) => Movie.fromJson(e)).toList();
  }

  Future<List<Movie>> getBlockedTitles() async {
    _log.i('fetching blocked titles');
    List<Map<String, dynamic>> blockedResults =
        await _databaseService.database!.query(_blockedTable);
    return blockedResults.map((e) => Movie.fromJson(e)).toList();
  }

  Future<void> addBlockedTitle({Movie? movie}) async {
    _log.i('adding blocked title: ${movie?.title}');
    await _databaseService.database!.insert(_blockedTable, movie!.toJson());
  }

  Future<void> removeBlockedTitle({Movie? movie}) async {
    _log.i('removing blocked title: ${movie?.title}');
    await _databaseService.database!.delete(
      _blockedTable,
      where: "Title = ?",
      whereArgs: [movie?.title],
    );
  }

  Future<bool> isBlocked({String? title}) async {
    _log.i('checking blocked state for $title');
    bool status = false;
    var records = await _databaseService.database!.query(
      _blockedTable,
      where: "Title = ?",
      whereArgs: [title],
    );
    var data = records.map((e) => Movie.fromJson(e)).toList();
    if (data.isEmpty) {
      status = false;
      _log.i('status: $status');
    } else {
      status = true;
      _log.i('status: $status');
    }
    return status;
  }
}
