import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  Future getData() async {
    var response = await crud.postData(AppLinkApi.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
