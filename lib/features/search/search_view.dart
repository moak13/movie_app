import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../core/utils/context_util.dart';
import '../../core/utils/size_manager.dart';
import 'search_view.form.dart';
import 'view_model/search_viewmodel.dart';
import 'widgets/content.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class SearchView extends StatelessWidget with $SearchView {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);

    return ViewModelBuilder<SearchViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
      },
      onDispose: (model) {
        disposeForm();
      },
      viewModelBuilder: () => SearchViewModel(),
      builder: (
        BuildContext context,
        SearchViewModel model,
        Widget? child,
      ) {
        List<Widget> children = [
          ContentWidget(
            controller: searchController,
            focusNode: searchFocusNode,
          )
        ];

        if (model.isBusy) {
          children.add(
            const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            ContextUtils.hideKeyboard(context);
          },
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: Stack(
              children: children,
            ),
          ),
        );
      },
    );
  }
}
