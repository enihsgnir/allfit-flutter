import 'package:allfit_flutter/utils/storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultCachedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String path;

  const DefaultCachedImage({
    super.key,
    this.width,
    this.height,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: Storage.urlFromPath(path),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const SizedBox.shrink();
        }
        return CachedNetworkImage(
          imageUrl: data,
          imageBuilder: (context, imageProvider) {
            return Image(
              width: width,
              height: height,
              image: imageProvider,
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
      },
    );
  }
}
