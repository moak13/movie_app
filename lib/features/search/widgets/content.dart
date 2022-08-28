import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/utils/size_manager.dart';
import '../../../core/utils/string_util.dart';
import '../view_model/search_viewmodel.dart';
import 'info_box.dart';
import 'search_button.dart';

class ContentWidget extends ViewModelWidget<SearchViewModel> {
  ContentWidget({Key? key}) : super(key: key, reactive: false);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    var theme = Theme.of(context);
    SizeMg.init(context);
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
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Search for a movie',
                ),
                onSubmitted: (value) {
                  if (StringUtil.isEmpty(value)) {
                    return;
                  }
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
            viewModel.actionSearchMovie(title: controller.text.trim());
          },
        ),
        SizedBox(
          height: SizeMg.height(10),
        ),
      ],
    );
  }
}
