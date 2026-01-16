import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/controller/recomendation_controller.dart';
import 'package:e_commerce_halfa/view/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_link_api.dart';
import '../../../core/functions/translate_data_base.dart';
import '../../../data/model/recomendation_model.dart';

class RecommendationItem extends StatelessWidget {
  final RecomendationModel recomendationModel;
  RecommendationItem({super.key, required this.recomendationModel});
  final RecomendationController controller =
      Get.find<RecomendationController>();
  final HomeControllerImp homeControllerImp = Get.find<HomeControllerImp>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.off(
          () => ProductDetails(),
          arguments: {"productDetails": recomendationModel},
        );
      },
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "${AppLinkApi.productsImageLinkWithoutBack}/${recomendationModel.productImage}",
                cacheHeight: 90,
                cacheWidth: 90,
              ),
              Text(
                translateDataBase(
                  recomendationModel.proudctNameEn!,
                  recomendationModel.productNameAr!,
                ),
              ),
              Text("\$${recomendationModel.productPrice}"),
            ],
          ),
        ),
      ),
    );
  }
}
