import 'package:flutter/material.dart';

import '../../../core/shared_widgets/app_cache_network_image.dart';
import '../../../core/shared_widgets/image_error_widget.dart';
import '../../../core/utils/size_manager.dart';
import '../../../core/utils/string_util.dart';

class CardImage extends StatelessWidget {
  final String? imageUrl;
  const CardImage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    if (imageUrl == 'N/A') {
      return ImageErrorWidget(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(
            SizeMg.radius(5),
          ),
        ),
        height: SizeMg.height(120),
      );
    }
    if (StringUtil.isNotEmpty(imageUrl)) {
      return AppCacheNetworkImage(
        imageUrl: '$imageUrl',
        height: SizeMg.height(120),
        imageBuilder: (context, imageProvider) {
          return Container(
            height: SizeMg.height(120),
            width: SizeMg.width(200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                SizeMg.radius(5),
              ),
              image: DecorationImage(
                image: NetworkImage('$imageUrl'),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      );
    }
    return Container(
      height: SizeMg.height(120),
      width: SizeMg.width(200),
      alignment: Alignment.center,
      color: Colors.yellow,
      child: const Icon(
        Icons.image_not_supported,
        color: Colors.black,
      ),
    );
  }
}
