import 'package:e_commerce_halfa/view/screens/cart.dart';
import 'package:e_commerce_halfa/view/screens/favorite.dart';
import 'package:e_commerce_halfa/view/screens/home.dart';
import 'package:e_commerce_halfa/view/screens/profile.dart';
import 'package:e_commerce_halfa/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeWithBottomNavBarController extends GetxController {
  changeCurrentPage(int i);
}

class HomeWithBottomNavBarControllerImp extends HomeWithBottomNavBarController {
  final List pages = [
    HomePage(),
    ProfilePage(),
    FavoritePage(),
    SettingsPage(),
  ];
  List titleBottomAppBar = ["Home", "Profile", "Favorite", "Settings"];
  List iconBottomNavBar = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.favorite_border_outlined,
    Icons.settings_outlined,
  ];
  int selectedItem = 0;

  changeCurrentPage(int i) {
    selectedItem = i;
    update();
  }
}
