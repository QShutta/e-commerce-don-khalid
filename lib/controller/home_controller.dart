import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/home_data.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  goToProfile();
  goToSettings();
  logOut();
  getData();
  goToProductPage(List catogeries, int selectedCat, String productCat);
  // This function is used to get the data from the server.
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StautusRequest statusRequest = StautusRequest.none;
  HomeData homeData = HomeData(Get.find());
  String? userName;
  List<Catogeries> categories = [];
  TextEditingController searchController = TextEditingController();
  // List products = [];
  List<ProductsModel> products = [];
  initalData() {
    userName = myServices.sharedPreferences.getString("google_name");
    userName ??= "Guest";
    update();
  }

  @override
  void onInit() {
    getData();
    initalData();
    super.onInit();
  }

  @override
  goToProfile() {
    // Get.toNamed(AppRoutes.profile);
  }

  @override
  goToSettings() {
    // Get.toNamed(AppRoutes.settings);
  }

  @override
  logOut() async {
    await myServices.sharedPreferences.setBool("isLoggedIn", false);
    Get.offAllNamed(AppRoutes.signIn);
  }

  @override
  getData() async {
    print("----------------------------------------------------");
    print("inside of the getdata first line.");
    print("----------------------------------------------------");

    try {
      //The inital value for the statusRequest is loading.
      statusRequest = StautusRequest.loading;
      update();
      var response = await homeData.getData();
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          print("----------------------------------------------------");
          print(
            "inside of   if (response["
            ")",
          );
          print("----------------------------------------------------");

          categories =
              (response['catogeries']['data'] as List)
                  .map((catogery) => Catogeries.fromJson(catogery))
                  .toList();
          // print removed
          products =
              (response['products']['data'] as List)
                  .map((product) => ProductsModel.fromJson(product))
                  .toList();
          // print removed
        } else {
          statusRequest = StautusRequest.failure;
        }
      }
      update(); //This will update the UI
    } catch (e) {
      print('Error in HomeControllerImp.getData: $e');

      update();
    }
  }
  //Why did we pass the productCat?
  //Because we need to filter the products based on the selected category.
  //🔥 ليه ما بنستخدم بس selectedCat؟
  // لأنو:
  // السيرفر ما بفهم index، هو عايز الـ ID عشان يرجّع المنتجات الخاصة بتصنيف معين.
  // الـ index ممكن يتغير حسب طريقة العرض، لكن الـ ID ما بيتغير.

  @override
  goToProductPage(catogeries, selectedCat, productCat) {
    Get.toNamed(
      AppRoutes.productsRoot,
      arguments: {
        "catogeries": catogeries,
        "selecedCatogery": selectedCat,
        "product_catogery": productCat,
      },
    );
  }

  search() async {
    try {
      //The inital value for the statusRequest is loading.
      statusRequest = StautusRequest.loading;
      update();
      var response = await homeData.getData();
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          categories =
              (response['catogeries']['data'] as List)
                  .map((catogery) => Catogeries.fromJson(catogery))
                  .toList();
          // print removed
          products =
              (response['products']['data'] as List)
                  .map((product) => ProductsModel.fromJson(product))
                  .toList();
          // print removed
        } else {
          statusRequest = StautusRequest.failure;
        }
      }
      update(); //This will update the UI
    } catch (e) {
      print('Error in HomeControllerImp.getData: $e');

      update();
    }
  }
}
