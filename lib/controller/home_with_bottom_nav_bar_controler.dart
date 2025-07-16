import 'package:e_commerce_halfa/view/screens/cart.dart';
import 'package:e_commerce_halfa/view/screens/favorite.dart';
import 'package:e_commerce_halfa/view/screens/home.dart';
import 'package:e_commerce_halfa/view/screens/profile.dart';
import 'package:e_commerce_halfa/view/screens/settings.dart';
import 'package:get/get.dart';

abstract class HomeWithBottomNavBarController extends GetxController {
<<<<<<<< HEAD:lib/controller/home_with_bottom_nav_bar_controller.dart
  changePage(int currentPage);
========
  changeCurrentPage(int i);
>>>>>>>> my65:lib/controller/home_with_bottom_nav_bar_controler.dart
}

class HomeWithBottomNavBarControllerImp extends HomeWithBottomNavBarController {
  final List pages = [
    HomePage(),
    SettingsPage(),
    CartPage(),
    ProfilePage(),
    FavoritePage(),
  ];

  int selectedItem = 0;

  @override
<<<<<<<< HEAD:lib/controller/home_with_bottom_nav_bar_controller.dart
  changePage(int i) {
========
  changeCurrentPage(int i) {
>>>>>>>> my65:lib/controller/home_with_bottom_nav_bar_controler.dart
    selectedItem = i;
    update();
  }
}
