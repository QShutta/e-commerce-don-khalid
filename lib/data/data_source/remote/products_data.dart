import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class ProductData {
  Crud crud;
  ProductData(this.crud);

  Future getData() async {
    var response = await crud.postData(AppLinkApi.products, {});
    return response.fold((l) => l, (r) => r);
  }
}
