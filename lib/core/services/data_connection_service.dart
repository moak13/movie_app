import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../app/app.logger.dart';

abstract class DataConnectionService {
  Future<bool> getConnectionStatus();
}

class DataConnectionServiceImpl implements DataConnectionService {
  final log = getLogger('DataConnectionService');
  InternetConnectionChecker checker = InternetConnectionChecker();
  @override
  Future<bool> getConnectionStatus() async {
    log.i('connection check');
    return checker.hasConnection;
  }
}
