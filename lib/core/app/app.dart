import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../features/movie/movie_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/wrapper/wrapper_view.dart';
import '../services/data_connection_service.dart';
import '../services/database_service.dart';
import '../services/network_service.dart';
import '../stores/movie_store.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: WrapperView),
    AdaptiveRoute(page: MovieView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DatabaseMigrationService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: MovieStore),
    LazySingleton(
      classType: DataConnectionServiceImpl,
      asType: DataConnectionService,
    ),
    LazySingleton(
      classType: DioHttpServiceImpl,
      asType: DioHttpService,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
