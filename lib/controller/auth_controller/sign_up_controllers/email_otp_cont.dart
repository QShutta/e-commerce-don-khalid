import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/sign_up_otp.dart';
import 'package:get/get.dart';

abstract class EmailOtpCont extends GetxController {
  checkCode();
  resendCode();
  goToSuccessSignUpPage();
}

class EmailOtpControllerImp extends EmailOtpCont {
  late String varfyCode;
  late String email;
  //The error could be herer because of the statusRequest has not been initlized yet ...xxxxxxxxxxxxx
  StautusRequest? stautusRequest;
  SignUpOtpData signUpOtpData = SignUpOtpData(Get.find());
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void checkCode() async {
    stautusRequest = StautusRequest.loading;
    update();
    var response = await signUpOtpData.postData(email, varfyCode);
    stautusRequest = handlingStatusRequest(response);
    update();
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        goToSuccessSignUpPage();
      } else {
        stautusRequest = StautusRequest.failure;
        //الفشل بحصل فقط في حال انو الايميل هو كانمسجل مسبقا .
        Get.defaultDialog(
          title: "Warning",
          middleText: "The Otp that you have enter is incorrect",
        );
      }
    }
  }

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
