import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //These are for test burpose //عشان نجرب موضوع حذف المنتج
  //When the user swap the element to the left side or to the righ side.
  List<Map<String, dynamic>> cartItems = [
    {
      "title": "جلابية الدون",
      "price": 600,
      "count": 1,
      "image": ImageAssets.bannerDonJalabye,
    },
    {
      "title": "توب الدون",
      "price": 400,
      "count": 2,
      "image": ImageAssets.bannerDonTop1,
    },
  ];
  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    update();
  }

  void incrementItem(int index) {
    cartItems[index]["count"]++;
    update(); // تحدث الـ UI
  }

  void decrementItem(int index) {
    if (cartItems[index]["count"] > 0) {
      cartItems[index]["count"]--;
      update();
    }
  }
}
