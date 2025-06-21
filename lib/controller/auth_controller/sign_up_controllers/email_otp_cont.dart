import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/sign_up_otp_data.dart';
import 'package:get/get.dart';

abstract class EmailOtpCont extends GetxController {
  checkCode();
  resendCode();
  goToSuccessSignUpPage();
}

class EmailOtpControllerImp extends EmailOtpCont {
  SignUpOtpData signUpOtpData = SignUpOtpData(Get.find());
  late String varfyCode;
  late String email;
  StautusRequest? stautusRequest;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void checkCode() async {
    print("--------------------------------------");
    print("You'r verfy code is :$varfyCode");
    print("--------------------------------------");
    stautusRequest = StautusRequest.loading;
    update();
    var response = await signUpOtpData.postData(email, varfyCode);
    stautusRequest = handlingStatusRequest(response);
    update();
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        goToSuccessSignUpPage();
      } else {
        stautusRequest = StautusRequest.none;
        Get.defaultDialog(
          title: "Warning",
          middleText: "The otp you have entered is incorrect...",
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
