import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordEmailController extends GetxController {
  sendVarficationCode();
  goToVerficationCodePage();
  goToSignInPage();
}

class ForgotPasswordEmailControllerImp extends ForgotPasswordEmailController {
  late TextEditingController emailCont;

  @override
  void onInit() {
    emailCont = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailCont.dispose();
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
    // TODO: implement goToVerficationCodePage
    throw UnimplementedError();
  }
}
