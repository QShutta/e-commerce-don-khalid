import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/fav_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/favoritePageWidgets/favorite_page_product_widget.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/proudcts_page_widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final favController = Get.lazyPut<FavController>(
    () => FavController(),
    fenix: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(
        title: 'Favorites',
        onNotificationIconButtonClicked: () {},
        onChangeWhenSearh: (String) {},
        showNotificationAndFavorite: false,
        showSearch: false,
        onFavoriteButtonPressed: () {},
      ),
      body: GetBuilder<FavController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: controller.statusRequest,
            widget: GridView.builder(
              itemCount: controller.favProductList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //This to controll on the heigh of the card.
                mainAxisExtent: 210,
                crossAxisSpacing: 2.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                var favPoroduct = controller.favProductList[index];
                return FavoriteProductItem(
                  index: index,
                  images: CachedNetworkImage(
                    imageUrl:
                        "${AppLinkApi.productsImageLink}/${favPoroduct.productImage}",
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            Center(child: Lottie.asset(ImageAssets.loading)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  texts: favPoroduct.productNameAr!,
                  prices: favPoroduct.productPrice!.toString(),
                  onUserClickOnProduct: () {},
                  onFavButtonClicked: () {},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
