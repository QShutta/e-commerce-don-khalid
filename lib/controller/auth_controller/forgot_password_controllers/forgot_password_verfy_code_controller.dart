import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/reset_password_data/verfy_code_reset_data.dart';
import 'package:e_commerce_halfa/view/widgets/auth/warring_alert.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordVerfyCodeController extends GetxController {
  checkCode(varfyCode);
  goToResetPassowrd();
}

class ForgotPasswordVerfyCodeControllerImp
    extends ForgotPasswordVerfyCodeController {
  // المتغير ده بيخزن رمز التحقق
  //(OTP)
  //اللي المستخدم حيدخله،
  // وبيستخدم لاحقاً عشان نتحقق من صحته قبل ما نسمح له بتغيير كلمة السر.

  late String email;
  StautusRequest stautusRequest = StautusRequest.none;
  VerfyCodeResetData verfyCodeResetData = VerfyCodeResetData(Get.find());
  @override
  void onInit() async {
    email = Get.arguments['email'];
    print("-------------------------------------");
    print("You'r email is :$email");
    super.onInit();
  }

  @override
  goToResetPassowrd() {
    Get.toNamed(AppRoutes.resetPassword, arguments: {"email": email});
    print("-------------------------------------");
    print("You'r email is :$email");
  }

  @override
  checkCode(varfyCode) async {
    stautusRequest = StautusRequest.loading;
    update();
    var response = await verfyCodeResetData.postData(email, varfyCode);
    stautusRequest = handlingStatusRequest(response);
    update();
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        goToResetPassowrd();
      } else {
        stautusRequest = StautusRequest.failure;
        //الفشل بحصل فقط في حال انو الايميل هو كانمسجل مسبقا .

        showWarningAlert(titleKey: "65", messageKey: "76");
      }
    }
    print("valid");
  }
}
