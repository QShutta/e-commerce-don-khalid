import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageOptionArabic extends StatelessWidget {
  const LanguageOptionArabic({super.key});

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
            'icons/flags/png100px/sa.png',
            package: 'country_icons',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: langCont.lang!.languageCode == 'ar' ? 34 : 23),
        InkWell(
          onTap: () {
            langCont.changeLanguage("ar");
            Get.offAllNamed(AppRoutes.onBoarding);
          },
          child: Text(
            "11".tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
