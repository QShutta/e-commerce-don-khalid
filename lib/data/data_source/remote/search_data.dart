import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  Future searchData(String searchText) async {
    var response = await crud.postData(AppLinkApi.search, {
      "search_text": searchText,
    });
    return response.fold((l) => l, (r) => r);
  }
}
