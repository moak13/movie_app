import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/wrapper_viewmodel.dart';
import 'widgets/get_index_view.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
      onModelReady: (model) {
        model.stream.listen((event) {
          model.actionShowNetworkStatus(event);
        });
      },
      viewModelBuilder: () => WrapperViewModel(),
      builder: (
        BuildContext context,
        WrapperViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: GetIndexView(
              index: model.currentIndex,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
            ],
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
          ),
        );
      },
    );
  }
}
