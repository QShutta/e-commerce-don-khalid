import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/screens/notification_page.dart';
import 'package:e_commerce_halfa/view/screens/home.dart';
import 'package:e_commerce_halfa/view/screens/order/orders.dart';
import 'package:e_commerce_halfa/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeWithBottomNavBarController extends GetxController {
  goToFavoritePage();
  changeCurrentPage(int i);
}

class HomeWithBottomNavBarControllerImp extends HomeWithBottomNavBarController {
  final List pages = [
    HomePage(),
    MyOrdersPage(),
    NotficationPage(),
    SettingsPage(),
  ];
  TextEditingController searchController = TextEditingController();
  // We use a getter here so the titles are re-translated on every rebuild.
  // .tr is evaluated each time the UI accesses this list, not once at init.
  // This prevents the titles from becoming static when the app language changes.
  List get titleBottomAppBar => ["203".tr, "204".tr, "220".tr, "206".tr];

  List iconBottomNavBar = [
    Icons.home_outlined,
    Icons.shopping_bag_outlined,
    Icons.notifications_outlined,
    Icons.settings_outlined,
  ];
  int selectedItem = 0;
  //The purpose of the next tow method "checkSearch(),onSearchButtonCliced()" was the course instructor want when the user click on the
  //the search the content of the home page will be hiddden and when he remove the text from the textfield
  //means it finish the search the content of the search page will return back again.

  //This method is to check wither the user is currently searching or not.
  checkSearch(value) {
    //If the value is empty that means the user is not searching
    if (value.isEmpty || value == "") {
      Get.back();
    }
  }

  //This method will be called when the user click on the search button:
  onFinalSearchButtonClicked() {}

  @override
  goToFavoritePage() {
    print(
      "------------------------------THE GO METHOD-----------------------------",
    );
    Get.toNamed(AppRoutes.favorite);
  }

  @override
  changeCurrentPage(int i) {
    selectedItem = i;
    update();
  }
}
