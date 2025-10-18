import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class ViewNotficationData {
  Crud crud;
  ViewNotficationData(this.crud);

  Future getData(String userId) async {
    var response = await crud.postData(AppLinkApi.viewNotfication, {"notfication_user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
