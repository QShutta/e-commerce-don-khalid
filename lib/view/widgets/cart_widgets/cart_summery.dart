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
            controller.couponName != null
                ? Container(
                  padding: const EdgeInsets.all(12),

                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'تم تطبيق الكوبون:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Text(
                        controller.couponName!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
                : Container(
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
            TotalText(
              text: "الخصم".tr,
              price: "%${cartCont.discountCoupon}",
              color: AppColor.greyText,
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            TotalText(
              text: "سعر التوصيل".tr,
              price: "\$500",
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
              price: "\$${cartCont.getTotalPrice()}",
              color: AppColor.primaryColor,
            ),
          ],
        );
      },
    );
  }
}
