import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_color_widgit.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_quantity_widget.dart';
import 'package:e_commerce_halfa/view/widgets/product_details_widgets.dart/product_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductDetailsControllerImp productDetailsControllerImp = Get.find();
  ProductDetailsBody({super.key});

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
            SizedBox(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.start,
                translateDataBase(
                  productDetailsControllerImp.productModel.proudctNameEn!,
                  productDetailsControllerImp.productModel.productNameAr,
                ),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.start,
                translateDataBase(
                  productDetailsControllerImp.productModel.productDescEn!,
                  productDetailsControllerImp.productModel.productDescAr,
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColor.greyText),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.start,
                "\$${productDetailsControllerImp.productModel.productPrice}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 20),
            ProductSizeWidget(),
            SizedBox(height: 20),
            ProductColorsWidget(),
            SizedBox(height: 20),
            ProductQuantityWidget(),
          ],
        ),
      ),
    );
  }
}
