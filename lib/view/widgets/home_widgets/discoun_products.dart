import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/fav_controller.dart';
import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DiscountProducts extends StatelessWidget {
  final HomeControllerImp homeControllerImp = Get.find();
  final FavController favController = Get.put(FavController());

  final List<ProductsModel> productsList;
  // final bool isFav;
  DiscountProducts({
    super.key,
    required this.productsList,
    // required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavController>(
      builder: (controller) {
        return GridView.builder(
          itemCount: productsList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 5,
            mainAxisSpacing: 7,
          ),
          itemBuilder: (context, index) {
            final product = productsList[index];
            //This to fill the map with key,value.the key specfy wither the product is fav or not.
            //the value speacify wither it's fav or not.0,1.
            controller.isFav[product.productsId] = product.fav;
            return InkWell(
              onTap: () {
                print(
                  "The user clcik on spacfic proudct...Test.and the product is/n:${product.productNameAr}",
                );
                homeControllerImp.goToProductDetails(product);
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
                          IconButton(
                            onPressed: () {
                              print("--------------------------------------");
                              controller.printMap(controller.isFav);
                              print(
                                "-----------------------------------------",
                              );
                              if (controller.isFav[product.productsId] == "1") {
                                controller.setFav(product.productsId, "0");
                                controller.deleteFromFav(
                                  product.productsId.toString(),
                                );
                              } else {
                                controller.setFav(product.productsId, "1");
                                controller.addToFav(
                                  product.productsId.toString(),
                                );
                              }
                            },
                            icon:
                                controller.isFav[product.productsId] == "1"
                                    ? Icon(Icons.favorite, color: Colors.blue)
                                    : Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
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
