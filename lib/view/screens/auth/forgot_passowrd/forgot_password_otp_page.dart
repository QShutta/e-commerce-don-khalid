import 'package:e_commerce_halfa/controller/auth_controller/forgot_password_controllers/forgot_password_verfy_code_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/otp_form_forgot.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/otp_header.dart';
import 'package:e_commerce_halfa/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpPage extends StatelessWidget {
  const ForgotPasswordOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordVerfyCodeControllerImp otpCont = Get.put(
      ForgotPasswordVerfyCodeControllerImp(),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SafeArea(
        child: GetBuilder<ForgotPasswordVerfyCodeControllerImp>(
          builder: (_) {
            return HandlingDataRequest(
              stautusRequest: otpCont.stautusRequest,
              widget: ListView(
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
                            imageHight:
                                MediaQuery.of(context).size.height * 0.3,
                            imageWidth: 250,
                          ),

                          // الجزء السفلي (نموذج تسجيل الدخول)
                          OtpFormForgot(
                            onSubmit: (String verCode) {
                              otpCont.checkCode(verCode);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
