import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/enum/snack_bar_enum.dart';
import '../../../core/services/connectivity_service.dart';

class WrapperViewModel extends StreamViewModel<bool> {
  final _connectivityService = locator<ConnectivityService>();
  final _snackbarService = locator<SnackbarService>();
  final _log = getLogger('WrapperViewModel');
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void actionShowNetworkStatus(bool? value) {
    _log.i('status: $value');
    if (value == false) {
      return _snackbarHandler(
        message: 'Inactive',
        title: 'Connection Status',
        variant: SnackBarType.error,
      );
    }
    return _snackbarHandler(
      message: 'Active',
      title: 'Connection Status',
      variant: SnackBarType.success,
    );
  }

  void _snackbarHandler({
    dynamic variant,
    required String message,
    required String title,
  }) {
    _snackbarService.showCustomSnackBar(
      title: title,
      message: message,
      variant: variant,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Stream<bool> get stream => _connectivityService.connectionStatus;

  @override
  void dispose() {
    _connectivityService.disposeStream();
    super.dispose();
  }
}
