import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/cart_data.dart';
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

  int productCount = 0;
  StautusRequest statusRequest = StautusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    update();
  }

  void incrementItem(int index) {
    cartItems[index]["count"]++;
    update(); // تحدث الـ UI
  }

  void decrementItem(int index) {
    if (cartItems[index]["count"] > 1) {
      cartItems[index]["count"]--;
      update();
    }
  }

  addToCart(String productId) async {
    statusRequest = StautusRequest.loading;
    var response = await cartData.addToCart(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);

    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        // Get.snackbar("Success", "The product is added to the cart");
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
  }

  deleteFromCart(String productId) async {
    statusRequest = StautusRequest.loading;
    var response = await cartData.deleteFromCart(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);

    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
  }

  getProductCount(String productId) async {
    statusRequest = StautusRequest.loading;
    var response = await cartData.getProductCount(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);

    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        productCount = response['data'];
        print("------------------------------------------------------");
        print("The product count is $productCount");
        print("---------------------------------------------------------");
        update();
        return productCount;
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
  }
}
