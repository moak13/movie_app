import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final ShapeBorder shapeBorder;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const ShimmerWidget({
    Key? key,
    this.height,
    this.width,
    required this.shapeBorder,
    this.margin,
    this.padding,
  }) : super(key: key);

  const ShimmerWidget.rectangular({
    Key? key,
    this.width = double.infinity,
    required this.height,
    this.margin,
    this.padding,
    this.shapeBorder = const RoundedRectangleBorder(),
  }) : super(key: key);

  const ShimmerWidget.circular({
    Key? key,
    this.shapeBorder = const CircleBorder(),
    required this.height,
    required this.width,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffc2c9d1),
      highlightColor: const Color(0xffc2c9d1),
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: ShapeDecoration(
          color: Colors.grey[400],
          shape: shapeBorder,
        ),
      ),
    );
  }
}
