import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/utils/context_util.dart';
import '../../core/utils/size_manager.dart';
import '../../core/utils/string_util.dart';
import 'view_model/search_viewmodel.dart';
import 'widgets/info_box.dart';
import 'widgets/search_button.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);

    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (
        BuildContext context,
        SearchViewModel model,
        Widget? child,
      ) {
        List<Widget> children = [content];

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

  Widget get content {
    var theme = Theme.of(context);
    var model = getParentViewModel<SearchViewModel>(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Search',
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: SizeMg.text(50),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(
              top: SizeMg.height(30),
              left: SizeMg.width(10),
              right: SizeMg.width(10),
            ),
            children: [
              const InfoBox(),
              SizedBox(
                height: SizeMg.height(50),
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Search for a movie',
                ),
                onSubmitted: (value) {
                  if (StringUtil.isEmpty(value)) {
                    return;
                  }
                  model.actionSetTitle(value);
                },
              ),
              SizedBox(
                height: SizeMg.height(300),
              ),
            ],
          ),
        ),
        SearchButton(
          onTap: () {
            model.actionSearchMovie(title: model.searchText);
          },
        ),
        SizedBox(
          height: SizeMg.height(10),
        ),
      ],
    );
  }
}
