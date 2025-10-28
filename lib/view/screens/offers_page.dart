import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/offers_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return Scaffold(
      body: GetBuilder<OffersController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                var product = controller.productList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 200,
                          child: MyCachedImage(
                            fit: BoxFit.contain,
                            imageUrl:
                                "${AppLinkApi.productsImageLink}/${product.productImage}",
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Don Suite",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Text("Rate: 4.5", style: TextStyle(fontSize: 18)),
                              Spacer(),
                              ...List.generate(5, (index) {
                                return Icon(
                                  Icons.star_border_outlined,
                                  size: 20,
                                );
                              }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "\$100",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Icon(
                                  product.fav == 0
                                      ? Icons.favorite_border_outlined
                                      : Icons.favorite,
                                  size: 24,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
