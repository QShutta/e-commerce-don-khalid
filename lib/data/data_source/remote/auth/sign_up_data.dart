import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  Future postData(String name, String email, String password) async {
    print(
      "-------------------------inside the post data method---------------",
    );
    var response = await crud.postData(AppLinkApi.signUpLink, {
      "user_name": name,
      "user_email": email,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
