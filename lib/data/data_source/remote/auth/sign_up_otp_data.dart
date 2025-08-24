import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class SignUpOtpData {
  Crud crud;
  SignUpOtpData(this.crud);

  Future postData(String email, String verfyCode) async {
    print(
      "-------------------------inside the post data method---------------",
    );
    var response = await crud.postData(AppLinkApi.signUpOtpLink, {
      "user_email": email,
      "user_varfy_code": verfyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  //This method is used for what?
  //It's used to resend the verfication code.
  Future resendVerfyCode(String email) async {
    var response = await crud.postData(AppLinkApi.resendVerficationCode, {
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
