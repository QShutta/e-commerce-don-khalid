import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  Future postData(String email, String password) async {
    print(
      "-------------------------inside the post data method---------------",
    );
    var response = await crud.postData(AppLinkApi.resetPassword, {
      "user_email": email,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
