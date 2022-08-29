import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/utils/size_manager.dart';
import '../../../core/utils/string_util.dart';
import '../../../core/utils/validator.dart';
import '../view_model/search_viewmodel.dart';
import 'info_box.dart';
import 'search_button.dart';

class ContentWidget extends ViewModelWidget<SearchViewModel> {
  ContentWidget({Key? key}) : super(key: key, reactive: false);
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Search for a movie',
                  ),
                  onFieldSubmitted: (value) {
                    if (StringUtil.isEmpty(value)) {
                      return;
                    }
                  },
                  validator: (value) => Validator.validateField(
                    value,
                    errorMessage: 'Required',
                  ),
                ),
              ),
              SizedBox(
                height: SizeMg.height(300),
              ),
            ],
          ),
        ),
        SearchButton(
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              viewModel.actionSearchMovie(title: controller.text.trim());
            }
          },
        ),
        SizedBox(
          height: SizeMg.height(10),
        ),
      ],
    );
  }
}
