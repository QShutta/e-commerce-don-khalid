import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeController extends GetxController {
  goToProfile();
  goToSettings();
  logOut();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? userName;
  initalData() {
    userName = myServices.sharedPreferences.getString("google_name");
    if (userName == null) {
      userName = "Guest";
    }
    update();
  }

  @override
  void onInit() {
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
}
