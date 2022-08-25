import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../features/movie/movie_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/wrapper/wrapper_view.dart';
import '../services/data_connection_service.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: WrapperView),
    AdaptiveRoute(page: MovieView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(
      classType: DataConnectionServiceImpl,
      asType: DataConnectionService,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
