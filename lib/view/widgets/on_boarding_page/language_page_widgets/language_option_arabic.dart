import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageOptionArabic extends StatelessWidget {
  const LanguageOptionArabic({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            "11".tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          width: Localizations.localeOf(context).languageCode == 'ar' ? 38 : 10,
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: Image.asset(
            'icons/flags/png100px/sa.png',
            package: 'country_icons',
          ),
        ),
      ],
    );
  }
}
