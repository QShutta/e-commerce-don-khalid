import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/cupon_button_and_form.dart';
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
            Container(
              height: 70,
              padding: const EdgeInsets.only(
                left: 12,
                right: 25,
                top: 12,
                bottom: 12,
              ),
              child: CuponButtonAndForm(),
            ),
            SizedBox(height: 20),
            TotalText(
              text: "210".tr,
              price: "\$${cartCont.subTotalPrice}",
              color: AppColor.greyText,
            ),
            SizedBox(height: 10),
            TotalText(text: "الخصم".tr, price: "10%", color: AppColor.greyText),
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
