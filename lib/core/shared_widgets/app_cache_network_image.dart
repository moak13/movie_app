import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'image_error_widget.dart';
import 'shimmer_widget.dart';

class AppCacheNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final ImageWidgetBuilder? imageBuilder;
  const AppCacheNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.imageBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      progressIndicatorBuilder: (context, url, progress) {
        return ShimmerWidget.rectangular(height: height);
      },
      errorWidget: (context, url, error) {
        return ImageErrorWidget(
          height: height,
        );
      },
    );
  }
}
