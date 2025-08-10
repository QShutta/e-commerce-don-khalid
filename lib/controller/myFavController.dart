import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/favData.dart';
import 'package:e_commerce_halfa/data/model/favorite_model.dart';
import 'package:get/get.dart';

//What is the job of this controller?
//Contain method that bring all of the favorite products
//also contain method that allow you to remove the product from the favorite.
class Myfavcontroller extends GetxController {
  String? userId;
  StautusRequest statusRequest = StautusRequest.none;
  List<FavoriteModel> favProductList = [];
  FavData favData = FavData(Get.find());
  MyServices myServices = Get.find();
  removeFromFav(String favoriteId) {
    //هنا انا استخدمتة الطريقتين عشان احذف الطريقة الاولي هي عن طريق
    //استخدام ال delete backend and the secound metho is using the remove backend
    //الفرق بين الطريقتي بسيط جدا هي انو في الطريقة االولي انو نحن
    //In the fist method we depend on the favorite_id to remove the product from the favorite
    //In the secound method we depend on the product_id&user_id to remove product from the favorite
    //Both of the method work succfuly...You have the option to use each method.
    // favData.deleteFromFavorite(
    //   myServices.sharedPreferences.getString("user_id"),
    //   productId,
    // );
    // favProductList.removeWhere(
    //   (element) =>
    //       element.productId.toString() == productId.toString() &&
    //       element.userId.toString() ==
    //           myServices.sharedPreferences.getString("user_id"),
    // );
    favData.removeFromFavorite(favoriteId);
    favProductList.removeWhere(
      (element) => element.favoriteId.toString() == favoriteId.toString(),
    );

    update();
  }

  @override
  void onInit() {
    initValue();
    getFavProducts();
    super.onInit();
  }

  void initValue() {
    userId = myServices.sharedPreferences.getString("user_id");
  }

  getFavProducts() async {
    // print removed
    print("----------------------------------------------------------------");
    print("inside of the getFavProducts method...");
    print("----------------------------------------------------------------");
    // print removed
    favProductList.clear();

    statusRequest = StautusRequest.loading;
    update();
    var response = await favData.getData(userId!);
    statusRequest = handlingStatusRequest(response);
    // print removed
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        favProductList =
            (response['data'] as List)
                //.fromJson will convert the map to object model.
                .map((product) => FavoriteModel.fromJson(product))
                .toList();
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }

  goToProductDetails(FavoriteModel productDetails) {
    Get.toNamed(
      AppRoutes.favoriteProductDetails,
      arguments: {"favProductDetails": productDetails},
    );
    print("--------------------------------------------------");
    print("Test the product details:${productDetails.productNameAr}");
    print("--------------------------------------------------");
  }
}
