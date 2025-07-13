import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  goToProfile();
  goToSettings();
  logOut();
  getData();
  // This function is used to get the data from the server.
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StautusRequest statusRequest = StautusRequest.none;
  HomeData homeData = HomeData(Get.find());
  String? userName;
  List categories = [];
  List products = [];
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
    //The inital value for the statusRequest is loading.
    //So the value of the statusRequest before the request is made is loading.
    //And when finish getting the data, we will change the value of the statusRequest to success or failure.
    statusRequest = StautusRequest.loading;
    update();
    //We have to be careful that the getData function that we means here is the getData
    //that exist in the data folder that contain TestData class.
    //And the getData function that we means here is the getData function that exist in the TestData class.
    var response = await homeData.getData();
    //After getting the data we have to change the value of the statusRequest
    //So we have method called handleStatusRequest that will handle the statusRequest
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        categories.addAll(response['catogeries']);
        print("-------------------------------------");
        print("Categories: $categories");
        print("-------------------------------------");
        products.addAll(response['products']);
        print("-------------------------------------");
        print("Categories: $products");
        print("-------------------------------------");
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }
}
