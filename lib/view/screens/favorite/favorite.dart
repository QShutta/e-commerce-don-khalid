import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/myFavController.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/data/model/favorite_model.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/favoritePageWidgets/favorite_page_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final favController = Get.lazyPut<Myfavcontroller>(
    () => Myfavcontroller(),
    fenix: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(searchTextTitle: '701'.tr, textColor: Colors.black),

      body: GetBuilder<Myfavcontroller>(
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
                FavoriteModel favPoroduct = controller.favProductList[index];
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
                  onUserClickOnProduct: () {
                    controller.goToProductDetails(favPoroduct);
                  },
                  onDeleteIconButtonClicked: () {
                    controller.removeFromFav(favPoroduct.favoriteId.toString());
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
