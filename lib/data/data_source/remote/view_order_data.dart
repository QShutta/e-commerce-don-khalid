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

  Future deleteOrder(String orderId, String userId) async {
    var response = await crud.postData(AppLinkApi.deleteOrder, {
      "order_id": orderId,
      "user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future rateOrder(
    String orderId,
    String userId,
    orderRatingValue,
    orderRatingComment,
  ) async {
    var response = await crud.postData(AppLinkApi.rateOrder, {
      "order_id": orderId,
      "order_user_id": userId,
      "order_rating_value": orderRatingValue,
      "order_rating_comment": orderRatingComment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
