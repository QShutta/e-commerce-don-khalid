import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  Future getData() async {
    var response = await crud.postData(AppLinkApi.home, {});
    return response.fold((l) => l, (r) => r);
  }

  //The searchData will be here why?عشان البحث  حيكون في صفحتين في صفحة ال
  //home and in the products page.
  Future searchData(String searchText) async {
    var response = await crud.postData(AppLinkApi.search, {
      "search_text": searchText,
    });
    return response.fold((l) => l, (r) => r);
  }
}
