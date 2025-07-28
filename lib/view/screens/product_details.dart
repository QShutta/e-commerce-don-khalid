import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_form.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_header.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/add_to_cart__button.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_color_widgit.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_details_body.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_details_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  final ProductDetailsControllerImp productDetailsControllerImp = Get.put(
    ProductDetailsControllerImp(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddToCartButton(),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SafeArea(
        child: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) {
            return ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    // الجزء العلوي (الخلفية الملونة)
                    ProductDetailsHeader(
                      backgroundColor: AppColor.primaryColor,
                      containerHight: 300,
                      imageWidth: 300,
                      imageHeight: 300,
                      imageBottomSpace: 10,
                    ),
                    // Image.asset(ImageAssets.bannerDonJalabye),
                    // الجزء السفلي (نموذج تسجيل الدخول)
                    ProductDetailsBody(),
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
