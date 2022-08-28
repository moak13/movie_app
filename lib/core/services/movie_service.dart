import 'package:dio/dio.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/movie_model.dart';
import '../utils/config.dart';
import 'network_service.dart';

abstract class MovieService {
  String get apiKey;
  Future<Movie> getMovieByTitle({String? title});
}

class MovieServiceImpl implements MovieService {
  final _dioHttpService = locator<DioHttpService>();
  final _log = getLogger('MovieServiceImpl');
  @override
  String get apiKey => Configs.apiKey;

  @override
  Future<Movie> getMovieByTitle({String? title}) async {
    _log.i('function called');
    Map<String, String> params = {
      "t": "$title",
      "apiKey": apiKey,
    };

    try {
      final response = await _dioHttpService.appGet(
        '/',
        queryParameters: params,
      );
      return Movie.fromJson(response);
    } on DioError {
      rethrow;
    }
  }
}
