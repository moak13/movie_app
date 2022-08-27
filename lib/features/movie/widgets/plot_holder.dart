import 'package:flutter/material.dart';

import '../../../core/utils/size_manager.dart';

class PlotHolder extends StatelessWidget {
  final String? plot;
  const PlotHolder({
    Key? key,
    this.plot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return Container(
      height: SizeMg.height(100),
      width: SizeMg.screenWidth,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: SizeMg.width(5),
        right: SizeMg.width(5),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          SizeMg.radius(10),
        ),
      ),
      child: Text(
        '$plot',
        style: theme.textTheme.caption,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
