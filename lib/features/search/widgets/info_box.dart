import 'package:flutter/material.dart';

import '../../../core/utils/size_manager.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    var theme = Theme.of(context);
    return Container(
      height: SizeMg.height(100),
      width: SizeMg.screenWidth,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: SizeMg.width(10),
        right: SizeMg.width(10),
      ),
      padding: EdgeInsets.only(
        left: SizeMg.width(10),
        right: SizeMg.width(10),
      ),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(SizeMg.radius(5)),
      ),
      child: Text(
        'Use the input field to search for a movie or series you\'re interested in.',
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}
