import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultCachedImage extends StatelessWidget {
  final String imageUrl;

  const DefaultCachedImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.colorBurn,
              ),
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return CircularProgressIndicator(
          value: progress.progress,
          color: Colors.black,
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
