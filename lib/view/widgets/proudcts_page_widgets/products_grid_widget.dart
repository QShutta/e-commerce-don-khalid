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
import 'package:lottie/lottie.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<ProductsModel> productList;
  ProductsGridWidget({super.key, required this.productList});

  final ProductsControllerImp productsControllerImp = Get.put(
    ProductsControllerImp(),
  );
  final favController = Get.put<FavController>(FavController());
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
          fav: productList[index].fav.toString(),
          productPriceAfterDiscount:
              productList[index].priceAfterDiscount!.toString(),
          discount:
              productList[index].productDiscount, // Assuming fav is a string
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final String? imageUrl;
  final String? productName;
  final String? productPrice;
  final int? discount;
  final String? productPriceAfterDiscount;
  final String fav;
  final void Function()? onProductClicked;
  final int productId;
  const ProductItem({
    super.key,
    required this.onProductClicked,
    required this.productPriceAfterDiscount,
    required this.fav,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.discount,
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
                              controller.deleteFromFav(productId.toString());
                            } else {
                              controller.setFav(productId, "1");
                              controller.addToFav(productId.toString());
                            }
                            // //What did i have to put in this line?
                            // controller.setFav(
                            //   productId,
                            //   controller.isFav[productId] == "1" ? "0" : "1",
                            // );
                          },
                          icon:
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
                    discount == 0
                        ? Text(
                          "\$${productPrice!}",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$${productPrice!}",
                              style: TextStyle(
                                color: Colors.red,
                                decoration:
                                    TextDecoration.lineThrough, // 👈 هنا الخط
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "\$${productPriceAfterDiscount!}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
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
