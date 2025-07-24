import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TopProducts extends StatelessWidget {
  final HomeControllerImp homeControllerImp = Get.find();
  final List<ProductsModel> productsList;
  TopProducts({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.82,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        final product = productsList[index];
        return InkWell(
          onTap: () {
            print(
              "The user clcik on spacfic proudct...Test.and the product is/n:${product.productNameAr}",
            );
          },
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
                          (context, url) =>
                              Center(child: Lottie.asset(ImageAssets.loading)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
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
                  SizedBox(height: 8.0),
                  Text(
                    "\$${product.productPrice.toString()}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
