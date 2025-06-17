import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  Future postData(String userName, String email, String password) async {
    var response = await crud.postData(AppLinkApi.signUp, {
      "user_name": userName,
      "user_email": email,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
