import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/home_data.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  goToProfile();
  goToSettings();
  logOut();
  getData();
  goToProductPage(List catogeries, int selectedCat);
  // This function is used to get the data from the server.
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StautusRequest statusRequest = StautusRequest.none;
  HomeData homeData = HomeData(Get.find());
  String? userName;
  List<Catogeries> categories = [];
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
    try {
      //The inital value for the statusRequest is loading.
      statusRequest = StautusRequest.loading;
      update();
      var response = await homeData.getData();
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          categories =
              (response['catogeries'] as List)
                  .map((catogery) => Catogeries.fromJson(catogery))
                  .toList();
          print("-------------------------------------");
          print("Categories: $categories");
          print("-------------------------------------");
          products =
              (response['products'] as List)
                  .map((product) => ProductsModel.fromJson(product))
                  .toList();
          print("-------------------------------------");
          print("Products: $products");
          print("-------------------------------------");
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

  @override
  goToProductPage(catogeries, selectedCat) {
    Get.toNamed(
      AppRoutes.productsRoot,
      arguments: {"catogeries": catogeries, "selecedCatogery": selectedCat},
    );
  }
}
