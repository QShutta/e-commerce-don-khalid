import 'package:e_commerce_halfa/controller/auth_controller/sign_up_controllers/email_otp_cont.dart';
import 'package:e_commerce_halfa/controller/auth_controller/sign_up_controllers/sign_up_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/otp_header.dart';
import 'package:e_commerce_halfa/view/widgets/auth/otp_widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpOtp extends StatelessWidget {
  const SignUpOtp({super.key});

  @override
  Widget build(BuildContext context) {
    EmailOtpControllerImp otpControllerImp = Get.put(
      EmailOtpControllerImp(),
    ); // Initialize the controller
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    // الجزء العلوي (الخلفية الملونة)
                    OtpHeader(
                      imagePath: ImageAssets.forgotPasswordOtpImage,
                      height: MediaQuery.of(context).size.height * 0.4,
                      backgroundColor: AppColor.primaryColor,
                      imageHight: MediaQuery.of(context).size.height * 0.3,
                      imageWidth: 250,
                    ),

                    // الجزء السفلي (نموذج تسجيل الدخول)
                    OtpForm(
                      onSubmit: (String) {
                        otpControllerImp.goToSuccessSignUpPage();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
