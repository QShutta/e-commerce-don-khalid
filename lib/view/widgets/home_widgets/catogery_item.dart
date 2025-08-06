import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

class CategoryItem extends GetView<HomeControllerImp> {
  final String title;
  final String imageUrl;
  final int selectedCat;
  final List catogeries;
  final String catogeryId;
  MyServices myServices = Get.find();
  CategoryItem({
    required this.title,
    required this.imageUrl,
    required this.selectedCat,
    required this.catogeries,
    required this.catogeryId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,

      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          // هنا ممكن تضيف وظيفة عند الضغط
          // print removed
          controller.goToProductPage(catogeries, selectedCat, catogeryId);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40), // صورة دائرية
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 50,
                height: 50,
                placeholder:
                    (context, url) =>
                        Center(child: Lottie.asset(ImageAssets.loading)),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: imageUrl,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
