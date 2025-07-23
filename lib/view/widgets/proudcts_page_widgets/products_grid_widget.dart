import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<ProductsModel> productList;
  const ProductsGridWidget({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //This to controll on the heigh of the card.
        mainAxisExtent: 200,
        crossAxisSpacing: 2.0,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          imageUrl:
              "${AppLinkApi.productsImageLink}/${productList[index].productImage}",
          productName: productList[index].productNameAr,
          productPrice: productList[index].productPrice.toString(),
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final String? imageUrl;
  final String? productName;
  final String? productPrice;
  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
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
                      child: CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Center(
                              child: Lottie.asset(ImageAssets.loading),
                            ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Text(style: TextStyle(color: AppColor.greyText), productName!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline,
                        color: AppColor.primaryColor,
                      ),
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
