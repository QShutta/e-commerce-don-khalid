import 'package:e_commerce_halfa/controller/on_boarding_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Test add switch language
class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ),
      onPressed: onPressed,
      child:GetBuilder<OnBoardingControllerImp>(builder: (controller)=>Text(
       controller.isLastPage == true ? "218".tr :  "9".tr,
        // "218".tr => لنبدا
        // "Next".tr, // Next button text in Arabic
        // "التالي".tr, // Next button text in Arabic
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      )),
    );
  }
}
