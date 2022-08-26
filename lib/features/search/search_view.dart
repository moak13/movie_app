import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/utils/string_util.dart';
import 'view_model/search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (
        BuildContext context,
        SearchViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a movie',
                  suffixIcon: IconButton(
                    onPressed: () {
                      model.actionSearchMovie(title: model.searchText);
                    },
                    icon: const Icon(Icons.search_rounded),
                  ),
                ),
                onSubmitted: (value) {
                  if (StringUtil.isEmpty(value)) {
                    return;
                  }
                  model.actionSetTitle(value);
                },
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (model.movie == null) {
                      return const Center(
                        child: Text(
                          'Use the input field to search for a movie or series your interested in.',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    if (model.isBusy) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    return Center(
                      child: Text('${model.movie?.title}'),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
