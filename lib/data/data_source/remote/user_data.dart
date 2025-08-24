import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);

  Future getData(String userId) async {
    var response = await crud.postData(AppLinkApi.users, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
