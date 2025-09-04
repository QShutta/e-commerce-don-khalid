import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/search_data.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearchCont extends GetxController {
  TextEditingController? searchController;
  SearchData searchData = SearchData(Get.find());
  List<ProductsModel> searchResults = [];
  StautusRequest stautusRequest = StautusRequest.none;
  @override
  void onInit() {
    //I want once the page open the list to be empty:
    searchResults.clear();
    searchController = TextEditingController();
    super.onInit();
  }

  checkSearch(String value) {
    if (value.isEmpty || value == "") {
      // If the search field is empty, we can show all products or a message
      searchResults.clear();
      update(); //This will update the UI
    }
  }

  onFinalSearchButttonClicked() {
    print("-------------------------------------------------------");
    print("the final search button is clicked ");
  }

  search(String searchText) async {
    searchResults.clear();
    // print removed
    stautusRequest = StautusRequest.loading;
    update();
    var response = await searchData.searchData(searchText);
    stautusRequest = handlingStatusRequest(response);
    // print removed
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        searchResults =
            (response['data'] as List)
                //.fromJson will convert the map to object model.
                .map((product) => ProductsModel.fromJson(product))
                .toList();
      } else {
        stautusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }

  goToProductDetails(productDetails) {
    Get.toNamed(
      AppRoutes.productDetails,
      arguments: {"productDetails": productDetails},
    );
  }
}
