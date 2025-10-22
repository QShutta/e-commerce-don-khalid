import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  Future getData(orderId) async {
    var response = await crud.postData(AppLinkApi.orderDetails, {
      "order_id": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
