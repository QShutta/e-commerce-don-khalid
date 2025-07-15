import 'package:e_commerce_halfa/view/screens/cart.dart';
import 'package:e_commerce_halfa/view/screens/favorite.dart';
import 'package:e_commerce_halfa/view/screens/home.dart';
import 'package:e_commerce_halfa/view/screens/profile.dart';
import 'package:e_commerce_halfa/view/screens/settings.dart';
import 'package:get/get.dart';

class HomeWithBottomNavBarController extends GetxController {
  final List pages = [
    HomePage(),
    SettingsPage(),
    CartPage(),
    ProfilePage(),
    FavoritePage(),
  ];

  int selectedItem = 0;
}
