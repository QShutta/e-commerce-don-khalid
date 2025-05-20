import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/email_header.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/forgot_password_form.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/otp_header.dart';
import 'package:e_commerce_halfa/view/widgets/auth/otp_widgets/otp_form.dart';
import 'package:flutter/material.dart';

class ForgotPasswordOtpPage extends StatelessWidget {
  const ForgotPasswordOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  // الجزء العلوي (الخلفية الملونة)
                  OtpHeader(
                    imagePath: ImageAssets.forgotPasswordOtpImage,
                    height: 350,
                    backgroundColor: AppColor.primaryColor,
                    imageHight: 250,
                    imageWidth: 250,
                  ),

                  // الجزء السفلي (نموذج تسجيل الدخول)
                  OtpForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
