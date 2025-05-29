import 'package:e_commerce_halfa/controller/auth_controller/forgot_password_controllers/reset_password_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/functions/valid_input.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_button.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordForm extends StatelessWidget {
  final ResetPasswordControllerImp controller =
      Get.find<ResetPasswordControllerImp>();
  ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 250,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Center(
                  child: Text(
                    "45".tr,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 8),
                //Subtitle
                Center(
                  child: Text(
                    "46".tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColor.greyText),
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      // Password
                      CustomTextFormField(
                        focusNode: controller.passwordFocus,
                        isPassword: true,
                        label: "20".tr,
                        hint: "21".tr,

                        onFieldSubmitted: (val) {
                          FocusScope.of(
                            context,
                          ).requestFocus(controller.confitmPasswordFocus);
                        },
                        textcontroller: controller.passwordCont,
                        validator: (String? value) {
                          return validInput(value!, 3, 100, "password");
                        },
                      ),
                      const SizedBox(height: 15),

                      // Confirm Password
                      CustomTextFormField(
                        focusNode: controller.confitmPasswordFocus,
                        isPassword: true,
                        label: "38".tr,
                        hint: "38".tr,
                        textcontroller: controller.confitmPasswordCont,
                        validator: (String? value) {
                          return validInput(value!, 3, 100, "password");
                        },
                      ),

                      const SizedBox(height: 30),

                      // Create Button
                      SignButton(
                        text: "47".tr,
                        onPressed: () {
                          controller.resetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
