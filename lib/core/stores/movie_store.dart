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
}
