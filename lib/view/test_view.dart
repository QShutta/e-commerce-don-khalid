import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/recomendation_controller.dart';
import 'package:e_commerce_halfa/data/model/recomendation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestRecomendation extends StatelessWidget {
  TestRecomendation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecomendationController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Test Recomendation Start"),
          SizedBox(
            height: 200,
            child: GetBuilder<RecomendationController>(
              builder: (recomendationController) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recomendationController.productList.length,
                  itemBuilder: (context, index) {
                    RecomendationModel recomendedProduct =
                        recomendationController.productList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Image.network(
                          "${AppLinkApi.productsImageLink}/${recomendedProduct.productImage}",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Text("Test Recomendation End"),
        ],
      ),
    );
  }
}
