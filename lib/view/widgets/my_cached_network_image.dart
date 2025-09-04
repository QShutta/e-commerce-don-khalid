import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:lottie/lottie.dart';

class MyCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const MyCachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder:
          (context, url) => Center(child: Lottie.asset(ImageAssets.loading)),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
