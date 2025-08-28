import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      // margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
      //Why did you put this white color?xxxxxxxxxxxxxxxxxxxxxx
      color: Colors.white,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.cart);
        },
        style: ElevatedButton.styleFrom(
          // backgroundColor: AppColor.begie, // Use primary color for the button
          backgroundColor: Color.fromARGB(255, 208, 230, 247),
          // backgroundColor: Color.fromARGB(255, 154, 204, 243),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: Text(
          "209".tr,
          style: TextStyle(
            color: AppColor.darkGrey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
