import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductsGrid extends GetView<ProductsControllerImp> {
  final List<ProductsModel>? product;
  ProductsGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product?.length ?? 0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 200,
        crossAxisSpacing: 2.0,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          images: CachedNetworkImage(
            imageUrl:
                "${AppLinkApi.productsImageLink}/${product![index].productImage}",
            fit: BoxFit.cover,
            placeholder:
                (context, url) =>
                    Center(child: Lottie.asset(ImageAssets.loading)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          texts: product![index].productNameAr!,
          prices: product![index].productPrice.toString(),
          onUserClickOnProduct: () {},
          onFavButtonClicked: () {},
          index: index,
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Widget images;
  final String texts;
  final String prices;
  final void Function()? onUserClickOnProduct;
  final void Function()? onFavButtonClicked;
  final int? index;
  const ProductItem({
    super.key,
    required this.index,
    required this.images,
    required this.texts,
    required this.prices,
    required this.onUserClickOnProduct,
    required this.onFavButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onUserClickOnProduct,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: images,
                    ),
                  ),
                ),
                Text(style: TextStyle(color: AppColor.greyText), texts),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onFavButtonClicked,
                      icon: Icon(
                        Icons.favorite_outline,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Text(
                      "\$${prices}",
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
