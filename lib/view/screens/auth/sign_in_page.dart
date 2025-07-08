import 'package:e_commerce_halfa/controller/auth_controller/sign_in_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/functions/alert_exist.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_form.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final SignInControllerImp signInController = Get.put(SignInControllerImp());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      // ✅ أولًا:
      // canPop: false
      // معناها: ما تخلي المستخدم يخرج من الصفحة مباشرة لما يضغط زر الرجوع.
      // يعني Flutter
      // ح يمنع الخروج، ويشغّل
      //onPopInvokedWithResult
      // بدلًا من الخروج.
      canPop: false,

      // ✅ ثانيًا: onPopInvokedWithResult
      // دي دالة بتشتغل لما المستخدم يضغط زر الرجوع من الهاتف أو التطبيق.

      // ✅ ثالثًا: شرح المعاملات
      //(didPop, result)
      // didPop = true
      // لو فعلاً خرج من الصفحة،
      //false لو ما خرج
      // result = معلومات زيادة عن سبب الرجوع (لكن غالبًا ما بنحتاجه)
      onPopInvokedWithResult: (didPop, result) {
        // ✅ الشرط:
        // if (!didPop) => لو المستخدم حاول يخرج، لكن ما خرج
        // نعرض تنبيه للتأكيد أو نمنع الخروج مؤقتًا.
        if (!didPop) {
          alertExit();
        }
      },

      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.primaryColor, // Match top Container's color
        body: SafeArea(
          child: GetBuilder<SignInControllerImp>(
            builder: (controller) {
              return HandlingDataRequest(
                stautusRequest:
                    signInController.stautusRequest ?? StautusRequest.none,
                widget: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
