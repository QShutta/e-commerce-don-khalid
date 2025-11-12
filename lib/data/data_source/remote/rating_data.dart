import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);

  Future rateProduct(userId, productId, ratingValue) async {
    print("--------------------------------------------");
    print("This is the start of the rateProductData function");
    print("--------------------------------------------");
    var response = await crud.postData(AppLinkApi.ratingLink, {
      "rating_user_id": userId,
      "rating_product_id": productId,
      "rating_value": ratingValue,
    });
    print("--------------------------------------------");
    print("this is the endo fo rateProductData function");
    print("--------------------------------------------");
    return response.fold((l) => l, (r) => r);
  }

  Future getOneProductData(productId) async {
    var response = await crud.postData(AppLinkApi.getOneProductDataLink, {
      "products_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
