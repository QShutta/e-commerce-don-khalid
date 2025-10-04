import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class ViewOrderData {
  Crud crud;
  ViewOrderData(this.crud);

  Future getData(String userId) async {
    var response = await crud.postData(AppLinkApi.viewOrder, {
      "order_user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
