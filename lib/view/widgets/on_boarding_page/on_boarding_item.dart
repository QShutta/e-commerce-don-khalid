import 'package:e_commerce_halfa/controller/on_boarding_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/data/data_source/static_data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// GetView<OnBoardingControllerImp> is a shortcut for using Get.find()
// It gives direct access to the controller without writing:
// final controller = Get.find<OnBoardingControllerImp>();
// So you can just use "controller" directly in the widget.

class OnBoardingItem extends GetView<OnBoardingControllerImp> {
  const OnBoardingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: PageView.builder(
        controller: controller.pageController,
        // This function is called when the user moves between onboarding pages.
        // It sends the new page index (value) to the controller
        // so the controller can handle any logic related to page change,
        // like updating indicators or checking if it's the last page.
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SvgPicture.asset(onboardingList[index].imagePath, height: 450),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColor.onboardingImageColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  onboardingList[index].title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  onboardingList[index].description,
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.greyText,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
