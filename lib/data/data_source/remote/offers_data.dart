import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  Future getData() async {
    var response = await crud.postData(AppLinkApi.offerPageLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
