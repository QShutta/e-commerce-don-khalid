import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CuponButtonAndForm extends StatelessWidget {
  CuponButtonAndForm({super.key});

  final CartController cartCont = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // textfield takes most of the width
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: cartCont.couponController,
            style: TextStyle(color: Colors.black),
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              hintText: 'Enter coupon code',

              /*border = القاعدة العامة (يستخدم إذا ما حددت غيره).
                        enabledBorder = للحالة العادية.
                        focusedBorder = عند الكتابة أو الفوكس. */
              enabledBorder: OutlineInputBorder(
                // 👈 في الحالة العادية
                borderSide: BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),

              focusedBorder: OutlineInputBorder(
                // 👈 لما عليه فوكس
                borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),

              errorBorder: OutlineInputBorder(
                // 👈 لما فيه خطأ
                borderSide: BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),

              border: OutlineInputBorder(
                // default
                borderSide: BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // the button
        ElevatedButton(
          onPressed: () {
            cartCont.checkCoupon();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Apply',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
