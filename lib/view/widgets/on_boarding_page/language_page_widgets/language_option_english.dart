import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
import 'package:e_commerce_halfa/view/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class LanguageOptionEnglish extends StatelessWidget {
  const LanguageOptionEnglish({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController langCont = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 30,
          height: 20,
          child: Image.asset(
            'icons/flags/png100px/us.png',
            package: 'country_icons',
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(width: 10),
        InkWell(
          onTap: () {
            langCont.changeLanguage("en");

            Get.offAllNamed(AppRoutes.onBoarding);
          },
          child: Text(
            "12".tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
