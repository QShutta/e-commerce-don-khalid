import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsHeader extends StatelessWidget {
  final Color? backgroundColor;
  final double containerHight;
  final String? imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final double? imageBottomSpace;

  const ProductDetailsHeader({
    super.key,
    required this.imagePath,
    required this.containerHight,
    this.backgroundColor = const Color(0xFF3B5998),
    required this.imageWidth,
    required this.imageHeight,
    required this.imageBottomSpace,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: containerHight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // اللون الخلفي
          Container(
            width: double.infinity,
            height: containerHight,
            color: backgroundColor,
          ),

          Positioned(
            bottom: imageBottomSpace,
            width: imageWidth,
            height: imageHeight,
            child: SizedBox(child: Image.asset(imagePath!, fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
