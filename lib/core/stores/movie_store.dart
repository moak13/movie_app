import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/movie_model.dart';
import '../services/database_service.dart';

const String _movieTable = 'movie';

class MovieStore {
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('MovieStore');

  Stream<List<Movie>> getStreamMovies() async* {
    _log.i('streaming movies');
    List<Map<String, dynamic>> movieResults =
        await _databaseService.database!.query(_movieTable);
    yield movieResults.map((e) => Movie.fromJson(e)).toList();
  }

  Future<List<Movie>> getMovies() async {
    _log.i('fetching movies');
    List<Map<String, dynamic>> movieResults =
        await _databaseService.database!.query(_movieTable);
    return movieResults.map((e) => Movie.fromJson(e)).toList();
  }

  Future<void> addMovie({Movie? movie}) async {
    _log.i('adding movie');
    await _databaseService.database!.insert(_movieTable, movie!.toJson());
  }

  Future<void> removeMovie({Movie? movie}) async {
    _log.i('removing movie');
    await _databaseService.database!
        .delete(_movieTable, where: "Title = ?", whereArgs: [movie?.title]);
  }

  Future<bool> isSaved({String? title}) async {
    _log.i('checking saved state for $title');
    bool status = false;
    var records = await _databaseService.database!.query(
      _movieTable,
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

  Stream<bool> isStreamedSaved({String? title}) async* {
    _log.i('checking saved stream state for $title');
    bool status = false;
    var records = await _databaseService.database!.query(
      _movieTable,
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
    yield status;
  }
}
