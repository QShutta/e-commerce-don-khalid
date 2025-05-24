import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class EmailOtpCont extends GetxController {
  checkCode();
  resendCode();
  goToSuccessSignUpPage();
}

class EmailOtpControllerImp extends EmailOtpCont {
  late String varfyCode;
  late String email;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void checkCode() {}

  @override
  goToSuccessSignUpPage() {
    Get.toNamed(AppRoutes.successSignUp);
  }

  @override
  resendCode() {
    // TODO: implement resendCode
    throw UnimplementedError();
  }
}
