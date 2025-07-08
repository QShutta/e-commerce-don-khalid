import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/reset_password_data/check_email_reset_data.dart';
import 'package:e_commerce_halfa/view/widgets/auth/warring_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordEmailController extends GetxController {
  sendCodeAndGoToOtp();
}

class ForgotPasswordEmailControllerImp extends ForgotPasswordEmailController {
  late TextEditingController textEmailCont;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StautusRequest statusRequest = StautusRequest.none;
  CheckEmailResetData checkEmailResetData = CheckEmailResetData(Get.find());

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
  sendCodeAndGoToOtp() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StautusRequest.loading;
      update();
      var response = await checkEmailResetData.postData(textEmailCont.text);
      statusRequest = handlingStatusRequest(response);
      update();
      if (statusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          Get.toNamed(
            AppRoutes.forgotPasswordOtp,
            arguments: {"email": textEmailCont.text},
          );
        } else {
          statusRequest = StautusRequest.failure;
          //الفشل بحصل فقط في حال انو الايميل هو كانمسجل مسبقا .

          showWarningAlert(titleKey: "65", messageKey: "77");
        }
      }
      print("valid");
    } else {
      print("not valid");
    }
  }
}
