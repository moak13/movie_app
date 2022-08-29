import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/utils/size_manager.dart';
import 'view_model/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) {
        model.actionHandleStartUp();
      },
      viewModelBuilder: () => SplashViewModel(),
      builder: (
        BuildContext context,
        SplashViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Center(
            child: Text(
              'Movie App',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.redAccent,
                fontSize: SizeMg.text(50),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
