import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class ProductData {
  Crud crud;
  ProductData(this.crud);

  Future getData(String productCat, String user_id) async {
    var response = await crud.postData(AppLinkApi.products, {
      "product_catogery": productCat,
      "user_id": user_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
