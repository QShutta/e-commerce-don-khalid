import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/cart_data.dart';
import 'package:e_commerce_halfa/data/model/cart_model.dart';
import 'package:get/get.dart';

//mistake in commit106
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
  //دة بحتوي ليك علي كل المنتجات القاعدة في السلة بي تفاصيلها .
  List<CartModel>? cartDetails = [];
  // subTotalPrice:
  // المجموع الفرعي لأسعار كل المنتجات في السلة (من غير سعر الشحن).
  // يعني لو عندك 3 منتجات بسعر 100, 200, 300 → المجموع = 600.
  double subTotalPrice = 0.0;
  // totalProductCount:
  // العدد الكلي لكل المنتجات المضافة في السلة.
  // يعني لو ضفت (2 قميص + 3 بنطلون) → الناتج 5.
  int totalProductCount = 0;

  // productCount:
  // العدد الخاص بمنتج واحد معين ضافو المستخدم للسلة.
  // يعني مثلاً منتج "قميص" ممكن المستخدم يضيف منو 2 أو 5.
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  //هنا حانا المتغير دة مستخدمنو في صفحة ال cart?
  //شنو فايدة المتغير دة ؟
  int productCount = 0;
  StautusRequest statusRequest = StautusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  @override
  void onInit() {
    viewCart();
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

  //This will be used to add product to the cart
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
    update();
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
    update();
  }

  getProductCount(String productId) async {
    statusRequest = StautusRequest.loading;
    update();
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
    update();
  }

  //بعد كل عملية حذف او اواضافة لمنتج من السلة يجب علينا تحديث ال
  //ui
  //بناء علي عملية الحذف او الاضافة .
  resetVar() {
    subTotalPrice = 0.0;
    totalProductCount = 0;
  }

  refreshView() {
    resetVar();
    viewCart();
  }

  viewCart() async {
    cartDetails!.clear();
    statusRequest = StautusRequest.loading;
    update();

    var response = await cartData.getCartData(
      myServices.sharedPreferences.getString("user_id"),
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        //By this condition we want to handle the case of that there is no product in the cart
        //نحنا حنجيب بيانات ونخزنها في اللست فقط في حال كان ال
        //the staus is sucess.other wise that means there is no data returned from the backend.
        if (response['data']['status'] == "success") {
          cartDetails!.clear();
          cartDetails!.addAll(
            response['data']['data']
                .map<CartModel>((item) => CartModel.fromJson(item))
                .toList(),
          );
          Map dataResponseCountPrice = response['count_price'];
          //The data will came to us in string for so we will convert it to (int,double) to do
          //SUM,DIV,MULT operation.
          totalProductCount = int.parse(
            dataResponseCountPrice['product_count'],
          );
          subTotalPrice = double.parse(
            dataResponseCountPrice['subTotal'].toString(),
          );
        }
        update();
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update();
  }
}
