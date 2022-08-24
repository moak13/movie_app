import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void _actionRouteWrapperView() {
    _navigationService.navigateToWrapperView();
  }

  void actionHandleStartUp() async {
    const duration = Duration(seconds: 3);
    Timer(duration, _actionRouteWrapperView);
  }
}
