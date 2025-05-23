import 'package:e_commerce_halfa/controller/auth_controller/forgot_password_controllers/forgot_password_email_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/email_header.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordEmailControllerImp emailController = Get.put(
      ForgotPasswordEmailControllerImp(),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Column(
              children: [
                // الجزء العلوي (الخلفية الملونة)
                EmailHeader(
                  imagePath: ImageAssets.forgotPasswordEmailImage,
                  height: 350,
                  imageHight: 300,
                  imageWidth: 300,
                  backgroundColor: AppColor.primaryColor,
                ),

                // الجزء السفلي (نموذج تسجيل الدخول)
                EmailForm(
                  onPressed: () {
                    emailController.goToVerficationCodePage();
                  },
                  textEmailCont: emailController.textEmailCont,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
