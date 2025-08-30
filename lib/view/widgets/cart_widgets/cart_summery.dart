import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/total_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartSummery extends StatelessWidget {
  CartSummery({super.key});

  final CartController cartCont = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Column(
          children: [
            TotalText(
              text: "210".tr,
              price: "\$${cartCont.subTotalPrice}",
              color: AppColor.greyText,
            ),
            SizedBox(height: 10),
            TotalText(
              text: "214".tr,
              price: "\$10.00",
              color: AppColor.greyText,
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: Colors.grey,
              endIndent: 20.0,
              indent: 20.0,
            ),
            SizedBox(height: 10),
            TotalText(
              text: "211".tr,
              price: "\$610.00",
              color: AppColor.primaryColor,
            ),
          ],
        );
      },
    );
  }
}
