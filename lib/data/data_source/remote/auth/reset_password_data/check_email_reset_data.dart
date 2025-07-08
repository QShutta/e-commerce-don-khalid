import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class CheckEmailResetData {
  Crud crud;
  CheckEmailResetData(this.crud);

  Future postData(String email) async {
    print(
      "-------------------------inside the post data method---------------",
    );
    var response = await crud.postData(AppLinkApi.checkEmailReset, {
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
