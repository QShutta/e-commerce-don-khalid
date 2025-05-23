import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordEmailController extends GetxController {
  sendVarficationCode();
  goToVerficationCodePage();
  goToSignInPage();
}

class ForgotPasswordEmailControllerImp extends ForgotPasswordEmailController {
  late TextEditingController textEmailCont;

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
  void sendVarficationCode() {}

  @override
  goToSignInPage() {
    // TODO: implement goToSignInPage
    throw UnimplementedError();
  }

  @override
  goToVerficationCodePage() {
    Get.toNamed(
      AppRoutes.forgotPasswordOtp,
      arguments: {"email": textEmailCont.text},
    );
  }
}
