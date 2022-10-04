import 'package:allfit_flutter/utils/storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String path;

  const CustomCachedImage({
    super.key,
    this.width,
    this.height,
    this.fit,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: Storage.urlFromPath(path),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          final width = this.width;
          final height = this.height;
          if (width == null && height == null) {
            return const SizedBox.shrink();
          } else if (width != null && height != null) {
            return SizedBox.fromSize(size: Size(width, height));
          }
          return SizedBox.square(dimension: width ?? height);
        }

        return CachedNetworkImage(
          imageUrl: data,
          imageBuilder: (context, imageProvider) {
            return Image(
              width: width,
              height: height,
              fit: fit,
              image: imageProvider,
            );
          },
          progressIndicatorBuilder: (context, url, progress) {
            return CircularProgressIndicator(
              value: progress.progress,
              color: Colors.black,
            );
          },
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: width ?? height,
          ),
        );
      },
    );
  }
}
