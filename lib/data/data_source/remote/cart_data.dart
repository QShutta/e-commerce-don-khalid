import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  Future addToCart(userId, productId) async {
    var response = await crud.postData(AppLinkApi.addToCart, {
      "cart_user_id": userId,
      "cart_product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future deleteFromCart(userId, productId) async {
    var response = await crud.postData(AppLinkApi.deleteFromCart, {
      "cart_user_id": userId,
      "cart_product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future getProductCount(userId, productId) async {
    var response = await crud.postData(AppLinkApi.getProductCount, {
      "cart_user_id": userId,
      "cart_product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future getCartData(userId) async {
    var response = await crud.postData(AppLinkApi.viewCart, {
      "cart_user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
