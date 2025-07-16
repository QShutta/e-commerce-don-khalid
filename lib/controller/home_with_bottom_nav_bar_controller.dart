import 'package:e_commerce_halfa/view/screens/cart.dart';
import 'package:e_commerce_halfa/view/screens/favorite.dart';
import 'package:e_commerce_halfa/view/screens/home.dart';
import 'package:e_commerce_halfa/view/screens/profile.dart';
import 'package:e_commerce_halfa/view/screens/settings.dart';
import 'package:get/get.dart';

abstract class HomeWithBottomNavBarController extends GetxController {
  changePage(int currentPage);
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
  changePage(int i) {
    selectedItem = i;
    update();
  }
}
