import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductDetailsHeader extends StatelessWidget {
  final Color? backgroundColor;
  final double containerHight;
  final double? imageWidth;
  final double? imageHeight;
  final double? imageBottomSpace;
  ProductDetailsHeader({
    super.key,
    required this.containerHight,
    // this.backgroundColor = const Color(0xFF3B5998),
    required this.backgroundColor,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageBottomSpace,
  });

  final ProductDetailsControllerImp productDetailsControllerImp = Get.find();
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
            // child: SizedBox(child: Image.asset(imagePath!, fit: BoxFit.cover)),
            child: Hero(
              transitionOnUserGestures: true,
              tag: productDetailsControllerImp.productModel.productsId!,
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLinkApi.productsImageLinkWithoutBack}/${productDetailsControllerImp.productModel.productImage}",
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        Center(child: Lottie.asset(ImageAssets.loading)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
