import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_up_widgets/sign_up_form.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                // الجزء العلوي (الخلفية الملونة)
                SignHeader(
                  imagePath: ImageAssets.signUpImage,
                  title: "27".tr,

                  subtitle: "28".tr,
                  buttonText: "22".tr,
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.signIn);
                  },
                  backgroundColor: AppColor.primaryColor,
                  height: 300,
                ),

                // الجزء السفلي (نموذج تسجيل الدخول)
                SignUpForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
