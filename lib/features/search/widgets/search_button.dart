import 'package:flutter/material.dart';

import '../../../core/utils/size_manager.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SearchButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    var theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: SizeMg.height(70),
          width: SizeMg.width(300),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(SizeMg.radius(5)),
          ),
          alignment: Alignment.center,
          child: Text(
            'Submit',
            style: theme.textTheme.button,
          ),
        ),
      ),
    );
  }
}
