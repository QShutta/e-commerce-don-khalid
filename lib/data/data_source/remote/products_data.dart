import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);

  Future getData() async {
    var response = await crud.postData(AppLinkApi.products, {});

    return response.fold((l) => l, (r) => r);
  }
}
