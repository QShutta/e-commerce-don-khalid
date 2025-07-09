import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  Future getData() async {
    var response = await crud.postData(AppLinkApi.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
}
