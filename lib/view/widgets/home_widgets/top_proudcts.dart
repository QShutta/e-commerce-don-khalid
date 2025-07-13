import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class TopProducts extends StatelessWidget {
  final HomeControllerImp homeControllerImp = Get.find();
  TopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: homeControllerImp.products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLinkApi.productsImageLink}/${homeControllerImp.products[index]["product_image"]}",
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            Center(child: Lottie.asset(ImageAssets.loading)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),

                SizedBox(height: 8.0),
                Text(
                  homeControllerImp.products[index]["product_name_ar"],
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  homeControllerImp.products[index]["product_price"].toString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
