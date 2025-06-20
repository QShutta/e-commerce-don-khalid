import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassForm extends StatelessWidget {
  const SuccessResetPassForm({super.key});
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
                    "48".tr,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 8),
                //Subtitle
                Center(
                  child: Text(
                    "49".tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColor.greyText),
                  ),
                ),
                const SizedBox(height: 15),

                // Create Button
                SignButton(
                  text: "13".tr,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Get.offAllNamed(AppRoutes.signIn);
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
