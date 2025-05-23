import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

abstract class ForgotPasswordVerfyCodeController extends GetxController {
  checkCode();
  goToResetPassowrd();
}

class ForgotPasswordVerfyCodeControllerImp
    extends ForgotPasswordVerfyCodeController {
  // المتغير ده بيخزن رمز التحقق
  //(OTP)
  //اللي المستخدم حيدخله،
  // وبيستخدم لاحقاً عشان نتحقق من صحته قبل ما نسمح له بتغيير كلمة السر.

  late String varfyCode;
  late String email;

  @override
  void onInit() async {
    email = Get.arguments['email'];

    print("-------------------------------------");
    print("You'r email is :$email");
    super.onInit();
  }

  @override
  goToResetPassowrd() {
    Get.toNamed(AppRoutes.resetPassword);
    print("-------------------------------------");
    print("You'r email is :$email");
  }

  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }
}
