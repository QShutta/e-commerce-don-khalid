import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/auth_controller/fav_product_details_controller.dart';
import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/view/widgets/favoritePageWidgets/fav_product_details_header.dart';
import 'package:e_commerce_halfa/view/widgets/favoritePageWidgets/favorite_product_details_body.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/add_to_cart__button.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_details_body.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_details_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavProductDetails extends StatelessWidget {
  FavProductDetails({super.key});
  FavProductDetailsControllerImp favProductDetailsControllerImp = Get.put(
    FavProductDetailsControllerImp(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddToCartButton(),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(
        255,
        248,
        235,
        200,
      ), // Match top Container's color
      body: SafeArea(
        child: GetBuilder<FavProductDetailsControllerImp>(
          builder: (controller) {
            return ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    // الجزء العلوي (الخلفية الملونة)
                    FavProductDetailsHeader(
                      backgroundColor: const Color.fromARGB(255, 253, 233, 184),
                      containerHight: 300,
                      imageWidth: 300,
                      imageHeight: 300,
                      imageBottomSpace: 10,
                      imageUrl:
                          '${AppLinkApi.productsImageLinkWithoutBack}/${favProductDetailsControllerImp.favoriteModel.productImage}',
                    ),
                    // Image.asset(ImageAssets.bannerDonJalabye),
                    // الجزء السفلي (نموذج تسجيل الدخول)
                    FavProductDetailsBody(),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
