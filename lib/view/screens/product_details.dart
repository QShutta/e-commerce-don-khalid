import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/add_to_cart__button.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddToCartButton(),
      // bottomNavigationBar: AddToCartButton(),
      resizeToAvoidBottomInset: true,
      // backgroundColor: const Color.fromARGB(
      //   255,
      //   248,
      //   235,
      //   200,
      // ),
      backgroundColor: Color.fromARGB(255, 208, 230, 247),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                // الجزء العلوي (الخلفية الملونة)
                ProductDetailsHeader(
                  // backgroundColor: const Color.fromARGB(255, 253, 233, 184),
                  backgroundColor: Color.fromARGB(255, 208, 230, 247),
                  containerHight: 300,
                  imageWidth: 300,
                  imageHeight: 300,
                  imageBottomSpace: 10,
                  imageUrl:
                      '${AppLinkApi.productsImageLinkWithoutBack}/${productDetailsControllerImp.productModel.productImage}',
                ),
                // Image.asset(ImageAssets.bannerDonJalabye),
                // الجزء السفلي (نموذج تسجيل الدخول)
                ProductDetailsBody(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
