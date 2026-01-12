import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  //Why did i have buildj to search?one for
  //until know i don't know why did i have done that before.there was  a reason but i don't remeber the reason is what.
  //I get the reason is that i have general search that search on all of the products wither that there is discount on them or not
  //and i also have a search spacficy in the discount page.so that the user search only on the products that there is a discount on them.
  Future searchData(String searchText) async {
    var response = await crud.postData(AppLinkApi.search, {
      "search_text": searchText,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future searchDiscountProducts(String searchText) async {
    var response = await crud.postData(AppLinkApi.searchOverDiscount, {
      "search_text": searchText,
    });
    return response.fold((l) => l, (r) => r);
  }
}
