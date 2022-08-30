import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  final double? height;
  final Decoration? decoration;
  const ImageErrorWidget({
    Key? key,
    this.height,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: decoration,
      child: const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
