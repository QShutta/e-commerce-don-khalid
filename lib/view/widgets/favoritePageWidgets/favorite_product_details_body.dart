import 'package:e_commerce_halfa/controller/auth_controller/fav_product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/productDetailsText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavProductDetailsBody extends StatelessWidget {
  FavProductDetailsControllerImp favProductDetailsControllerImp = Get.put(
    FavProductDetailsControllerImp(),
  );
  FavProductDetailsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 250,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsText(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              text: translateDataBase(
                favProductDetailsControllerImp.favoriteModel.proudctNameEn!,
                favProductDetailsControllerImp.favoriteModel.productNameAr,
              ),
            ),
            SizedBox(height: 20),
            ProductDetailsText(
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.greyText,
              ), //Description
              text: translateDataBase(
                favProductDetailsControllerImp.favoriteModel.productDescEn!,
                favProductDetailsControllerImp.favoriteModel.productDescAr,
              ),
            ),

            SizedBox(height: 10),
            ProductDetailsText(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              text:
                  "\$${favProductDetailsControllerImp.favoriteModel.productPrice}",
            ),
            SizedBox(height: 20),
            //Why did we add this condition?
            // Because some products don't have size or color options
            //So we display the data according to the product category.
            // (favProductDetailsControllerImp.favoriteModel.productCatogery ==
            //             22 ||
            //         favProductDetailsControllerImp
            //                 .favoriteModel
            //                 .productCatogery ==
            //             26)
            //     ? ProductQuantityWidget()
            //     : Column(
            //       children: [
            // ProductSizeWidget(),
            // SizedBox(height: 20),
            // ProductColorsWidget(),
            // SizedBox(height: 20),
            // ProductQuantityWidget(),
            // ],
            // ),
          ],
        ),
      ),
    );
  }
}
