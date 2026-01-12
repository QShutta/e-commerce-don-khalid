import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/controller/recomendationi_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../app_link_api.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constants/image_assets.dart';
import '../../../core/functions/translate_data_base.dart';

class RecommandationSection extends StatelessWidget {
  RecommandationSection({super.key});
  final HomeControllerImp homeControllerImp = Get.find<HomeControllerImp>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecomendationController>(
      init: RecomendationController(),
      builder: (controller) {
        if (controller.statusRequest == StautusRequest.loading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return GridView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 5,
            mainAxisSpacing: 7,
          ),
          itemBuilder: (context, index) {
            final product = controller.productList[index];
            //This to fill the map with key,value.the key specfy wither the product is fav or not.
            //the value speacify wither it's fav or not.0,1.
            return InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(4),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLinkApi.productsImageLink}/${product.productImage}",
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => Center(
                                child: Lottie.asset(ImageAssets.loading),
                              ),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),

                      SizedBox(height: 8.0),
                      Text(
                        "${translateDataBase(product.proudctNameEn, product.productNameAr!)}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // SizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$${product.productPrice.toString()}",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
