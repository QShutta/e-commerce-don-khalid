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

class ProductsGridWidget extends StatefulWidget {
  final List<ProductsModel> productList;
  ProductsGridWidget({super.key, required this.productList});

  @override
  State<ProductsGridWidget> createState() => _ProductsGridWidgetState();
}

class _ProductsGridWidgetState extends State<ProductsGridWidget> {
  final ProductsControllerImp productsControllerImp = Get.put(
    ProductsControllerImp(),
  );
  final FavController favController = Get.put(FavController());

  @override
  void initState() {
    super.initState();
    favController.initFavForProducts(widget.productList); // ✅ مرة واحدة فقط
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.productList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 210,
        crossAxisSpacing: 2.0,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var product = productsControllerImp.producstsLis![index];
        return ProductItem(
          productId: product.productsId!,
          imageUrl: "${AppLinkApi.productsImageLink}/${product.productImage}",
          productName: translateDataBase(
            product.proudctNameEn,
            product.productNameAr,
          ),
          productPrice: product.productPrice.toString(),
          productPriceAfterDiscount: product.priceAfterDiscount!.toString(),
          discount: product.productDiscount,
          fav: product.fav.toString(),
          onProductClicked: () {
            productsControllerImp.goToProductDetails(product);
          },
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
  ProductItem({
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
  final FavController favCont = Get.find(); // ✅ لا تعمل Get.put هنا

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onProductClicked,
        child: Card(
          elevation: 9,
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
                    height: 88,
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
                Text(
                  style: TextStyle(color: AppColor.greyText),
                  productName!,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return IconButton(
                        onPressed: () {
                          if (favCont.isFav.value[productId] == "1") {
                            favCont.setFav(productId, "0");
                            favCont.deleteFromFav(productId.toString());
                          } else {
                            favCont.setFav(productId, "1");
                            favCont.addToFav(productId.toString());
                          }
                          // //What did i have to put in this line?
                          // controller.setFav(
                          //   productId,
                          //   controller.isFav[productId] == "1" ? "0" : "1",
                          // );
                        },
                        icon:
                            favCont.isFav[productId] == "1"
                                ? Icon(
                                  Icons.favorite,
                                  color: AppColor.primaryColor,
                                )
                                : Icon(
                                  Icons.favorite_outline,
                                  color: Colors.grey,
                                ),
                      );
                    }),
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
