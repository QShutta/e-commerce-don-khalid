import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_form.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SingleChildScrollView(
        // السطر دا بيخلي الكيبورد يقفل (يختفي) لما المستخدم يسحب (يسكرول) في الشاشة،
        // بدل ما يفضل الكيبورد مفتوح ويغطي المحتوى.
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            children: [
              // الجزء العلوي (الخلفية الملونة)
              SignHeader(
                imagePath: ImageAssets.signInImage,
                title: "13".tr,
                subtitle: "14".tr,
                buttonText: "15".tr,
                onPressed: () {
                  // مثلاً تنقل لصفحة التسجيل
                  Get.toNamed(
                    AppRoutes.signUp,
                    // مدة التحريك (0.5 ثانية)
                  );
                },
                backgroundColor: AppColor.primaryColor,
                height: 300,
              ),

              // الجزء السفلي (نموذج تسجيل الدخول)
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
