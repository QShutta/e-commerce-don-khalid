import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/fav_controller.dart';
import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<ProductsModel> productList;
  ProductsGridWidget({super.key, required this.productList});

  ProductsControllerImp productsControllerImp = Get.put(
    ProductsControllerImp(),
  );

  FavController favController = Get.put(FavController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //This to controll on the heigh of the card.
        mainAxisExtent: 210,
        crossAxisSpacing: 2.0,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        //Why did the course instructor fill the map "isFav" here?why in this line?xxxxxxxxxxxxxxxxxxxxxx
        //هو ال isFav will be fill here مش مفتررض تكون في oninit why did he filled it here in this location?
        favController.isFav[productsControllerImp
                .producstsLis![index]
                .productsId] =
            productsControllerImp.producstsLis![index].fav;

        return ProductItem(
          imageUrl:
              "${AppLinkApi.productsImageLink}/${productList[index].productImage}",
          productName: translateDataBase(
            productList[index].proudctNameEn,
            productList[index].productNameAr,
          ),
          productPrice: productList[index].productPrice.toString(),
          onProductClicked: () {
            //productList
            //عبارة عن
            //List<ProductsModel>،
            // لذلك productList[index]
            // هو عنصر من نوع
            // ProductsModel
            productsControllerImp.goToProductDetails(productList[index]);
          },
          productId: productList[index].productsId!,
          fav: productList[index].fav.toString(), // Assuming fav is a string
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final String? imageUrl;
  final String? productName;
  final String? productPrice;
  final String fav;
  final void Function()? onProductClicked;
  final int productId;
  const ProductItem({
    super.key,
    required this.onProductClicked,
    required this.fav,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onProductClicked,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ), // ← زود الرقم حسب الشكل اللي تريده
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20), // ← نفس رقم التدوير
            ),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: productId,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl!,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => Center(
                                child: Lottie.asset(ImageAssets.loading),
                              ),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(style: TextStyle(color: AppColor.greyText), productName!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<FavController>(
                      builder: (controller) {
                        return IconButton(
                          onPressed: () {
                            if (controller.isFav[productId] == "1") {
                              controller.setFav(productId, "0");
                              controller.deleteFav(productId.toString());
                            } else {
                              controller.setFav(productId, "1");
                              controller.addFav(productId.toString());
                            }
                            // controller.setFav(
                            //   productId,
                            //   controller.isFav[productId] == "1" ? "0" : "1",
                            // );
                          },
                          icon:
                              //Why did this not work?xxxxxxxxxxxxxxxxxxxx
                              //Why did the color is not blue?xxxxxxxxxxxxxx
                              //It work when i wrap the 1 with "" why before of that doesn't work?xxx
                              controller.isFav[productId] == "1"
                                  ? Icon(
                                    Icons.favorite,
                                    color: AppColor.primaryColor,
                                  )
                                  : Icon(
                                    Icons.favorite_outline,
                                    color: Colors.grey,
                                  ),
                        );
                      },
                    ),
                    Text(
                      "\$${productPrice!}",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
