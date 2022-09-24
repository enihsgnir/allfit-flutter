import 'package:allfit_flutter/utils/storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultCachedImage extends StatelessWidget {
  final String path;

  const DefaultCachedImage({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: Storage.urlFromPath(path),
      builder: (context, snapshot) {
        return CachedNetworkImage(
          imageUrl: snapshot.requireData,
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
      },
    );
  }
}
