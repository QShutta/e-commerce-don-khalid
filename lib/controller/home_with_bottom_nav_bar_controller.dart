import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/screens/favorite/favorite.dart';
import 'package:e_commerce_halfa/view/screens/home.dart';
import 'package:e_commerce_halfa/view/screens/profile.dart';
import 'package:e_commerce_halfa/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeWithBottomNavBarController extends GetxController {
  changeCurrentPage(int i);
  goToFavoritePage();
}

class HomeWithBottomNavBarControllerImp extends HomeWithBottomNavBarController {
  final List pages = [
    HomePage(),
    ProfilePage(),
    FavoritePage(),
    SettingsPage(),
  ];
  List titleBottomAppBar = ["203".tr, "204".tr, "205".tr, "206".tr];
  List iconBottomNavBar = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.favorite_border_outlined,
    Icons.settings_outlined,
  ];
  int selectedItem = 0;

  @override
  changeCurrentPage(int i) {
    selectedItem = i;
    update();
  }

  @override
  goToFavoritePage() {
    print(
      "------------------------------THE GO METHOD-----------------------------",
    );
    Get.toNamed(AppRoutes.favorite);
  }
}
