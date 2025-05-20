import 'package:e_commerce_halfa/controller/auth_controller/reset_password_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_button.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordForm extends StatelessWidget {
  ResetPasswordForm({super.key});
  final ResetPasswordControllerImp resetCont = Get.put(
    ResetPasswordControllerImp(),
  );

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

                // Password
                CustomTextFormField(
                  focusNode: resetCont.passwordFocus,
                  isPassword: true,
                  label: "20".tr,
                  hint: "21".tr,
                  controller: resetCont.passwordCont,
                  onFieldSubmitted: (val) {
                    FocusScope.of(
                      context,
                    ).requestFocus(resetCont.confitmPasswordFocus);
                  },
                ),
                const SizedBox(height: 15),

                // Confirm Password
                CustomTextFormField(
                  focusNode: resetCont.confitmPasswordFocus,
                  isPassword: true,
                  label: "38".tr,
                  hint: "38".tr,
                  controller: resetCont.confitmPasswordCont,
                ),

                const SizedBox(height: 30),

                // Create Button
                SignButton(
                  text: "47".tr,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(AppRoutes.passwordResetSuccess);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
