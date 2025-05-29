import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordEmailController extends GetxController {
  goToVerficationCodePage();
  goToSignInPage();
}

class ForgotPasswordEmailControllerImp extends ForgotPasswordEmailController {
  late TextEditingController textEmailCont;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    textEmailCont = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    textEmailCont.dispose();
    super.dispose();
  }

  @override
  goToSignInPage() {
    // TODO: implement goToSignInPage
    throw UnimplementedError();
  }

  @override
  goToVerficationCodePage() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(
        AppRoutes.forgotPasswordOtp,
        arguments: {"email": textEmailCont.text},
      );
      print("valid");
    } else {
      print("not valid");
    }
  }
}
