import 'package:e_commerce_halfa/controller/on_boarding_controller.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/dots_indicator.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/next_button.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/on_boarding_item.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

//Test move from the last on boarding to the sign page page
class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // SafeArea بنستخدم
    // عشان نتجنب إن المحتوى يختفي ورا الـ
    //notch أو الـ status bar
    //✅ Notch يعني شنو؟
    // هو جزء صغير مقطوع من الشاشة من فوق، بيكون فيه:
    // الكاميرا الأمامية
    // السماعة
    // أحيانًا مستشعرات
    // مثال: في موبايل
    //iPhone X أو بعض أجهزة Android،
    // بتلقى في أعلى الشاشة مكان أسود صغير. دا هو الـ
    // Notch.
    // أو أي جزء من واجهة النظام في بعض الأجهزة
    // وده بيخلي التطبيق يظهر بشكل أفضل على جميع الأجهزة

    var onBoardingCont = Get.put(OnBoardingControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(
          children: [
            OnBoardingItem(),
            SizedBox(height: 20),
            DotsIndicator(),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: NextButton(
                onPressed: () {
                  onBoardingCont.next();
                },
              ),
            ),
            SizedBox(height: 15),
            SkipButton(
              onPressed: () {
                onBoardingCont.skipe();
              },
            ),
          ],
        ),
      ),
    );
  }
}
