import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class VerfyCodeResetData {
  Crud crud;
  VerfyCodeResetData(this.crud);

  Future postData(String email, String verfyCode) async {
    print(
      "-------------------------inside the post data method---------------",
    );
    var response = await crud.postData(AppLinkApi.verfyCodeReset, {
      "user_email": email,
      "user_varfy_code": verfyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
