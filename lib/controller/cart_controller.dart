import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/cart_data.dart';
import 'package:e_commerce_halfa/data/data_source/remote/coupon_data.dart';
import 'package:e_commerce_halfa/data/model/cart_model.dart';
import 'package:e_commerce_halfa/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//mistake in commit106
class CartController extends GetxController {
  CouponData couponData = CouponData(Get.find());
  //دة بحتوي ليك علي كل المنتجات القاعدة في السلة بي تفاصيلها .
  List<CartModel>? cartDetails = [];
  CouponModel couponModel = CouponModel();
  // subTotalPrice:
  // المجموع الفرعي لأسعار كل المنتجات في السلة (من غير سعر الشحن).
  // يعني لو عندك 3 منتجات بسعر 100, 200, 300 → المجموع = 600.
  double subTotalPrice = 0.0;
  // totalProductCount:
  // العدد الكلي لكل المنتجات المضافة في السلة.
  // يعني لو ضفت (2 قميص + 3 بنطلون) → الناتج 5.
  int totalProductCount = 0;

  TextEditingController? couponController;
  StautusRequest statusRequest = StautusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController? searchController;
  //طبعا قبل ما المستخدم يضغط علي الزر بتاع
  //applay the coupon discount value will become null
  //عشان ما يحصل خطا لازم نخزن القيمة في متغير قيمتو الابتدائية فاضي مش
  //null
  //because of null will cause error.
  int discountCoupon = 0;
  //Why did the course instrucotr make this as nullable and the prevois one is not null?
  //Because of the discountCoupon will be display in the UI so it should not be null once the page open
  //and the discountName will be use in the back yard.
  String? discountName;

  @override
  void onInit() {
    searchController = TextEditingController();
    couponController = TextEditingController();
    viewCart();
    super.onInit();
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

  //This method is used to get the total price بعد تطبيق الكوبون علية .
  getTotalPrice() {
    return (subTotalPrice - (subTotalPrice * discountCoupon / 100));
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

  checkCupon() async {
    statusRequest = StautusRequest.loading;
    update();
    var response = await couponData.getData(couponController!.text);
    statusRequest = handlingStatusRequest(response);

    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        // هنا بنأخذ البيانات القادمة من السيرفر (الجزء الخاص بالكوبون)
        // ونخزنها في متغير اسمه
        //couponMap (بيكون Map عادي)
        var couponMap = response['data'];

        // هنا بنحوّل الـ
        //Map
        // اللي فوق إلى
        //Object من نوع CouponModel
        // باستخدام الـ
        //constructor fromJson
        // علشان نقدر نتعامل معه كموديل بدلاً من
        // Map
        couponModel = CouponModel.fromJson(couponMap);
        discountCoupon = couponModel.couponDiscount!;
        print("--------------------------------------------");
        print(
          "------------------${couponModel.couponName}--------------------------",
        );
        print("--------------------------------------------");
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

  //I will use this method to get all of the products that the user put in the cart.
  viewCart() async {
    //The first thing that i will do is to clear the list why?
    //Every time i add or remove an elment from the cart i have fill the list with the newDATA
    //So i will make it empty then fill it again.
    cartDetails!.clear();
    statusRequest = StautusRequest.loading;
    update();
    //Why did we here just pass the userid?
    //we will bring all of the products that the user addedd to the cart.
    var response = await cartData.getCartData(
      myServices.sharedPreferences.getString("user_id"),
    );
    statusRequest = handlingStatusRequest(response);
    update();
    //This condition to check if the response is successful from the server or not
    if (statusRequest == StautusRequest.success) {
      //After response came to us the json look like this:
      /*status": "success",
    "data": {
        "status": "success",
        "data": [
            {
                "total_price_per_product": 2000,
                "productCount": 2, */
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
          // Here we take the "count_price" object from the response JSON.
          // This object is different from the product list; it is a summary of the cart.
          // It contains overall values like:
          //   - "subTotal": the total price of all products in the cart.
          //   - "product_count": the total number of products in the cart.
          // We will later convert these string values into int/double
          // so we can use them in calculations (sum, multiply, divide).

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
