import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/controller/recomendationi_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../app_link_api.dart';
import '../../core/constants/image_assets.dart';
import '../../core/functions/translate_data_base.dart';

class RecommendationScreen extends StatelessWidget {
  RecommendationScreen({super.key});
  final RecomendationController controller =
      Get.find<RecomendationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Recommendation for you",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: HnadlingDataView(
        stautusRequest: controller.statusRequest,
        widget: GridView.builder(
          itemCount: controller.productList.length,
          physics: const AlwaysScrollableScrollPhysics(),
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
        ),
      ),
    );
  }
}
