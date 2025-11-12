import 'dart:convert';

import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/cart_data.dart';
import 'package:e_commerce_halfa/data/data_source/remote/products_data.dart';
import 'package:e_commerce_halfa/data/data_source/remote/rating_data.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  void changeSelectedSize(String size);
  void changeSelctedColor(Color color);
  void increaseQuantity();
  void decreaseQuantity();
  //The rating is not neccery it's just chalnge that the coursee instructor give it to
  //Me so that he make sure that i understand the prevous lessons very will and i ready to impelment real world tasks.
  void rateProduct(productId, ratingValue);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  String selectedSize = '';
  Color selectedColor = Colors.black;
  int productCount = 0;
  CartData cartData = CartData(Get.find());
  List<ProductsModel>? producstsLis = [];

  //I will make an instance from the rating why?to rate the product.
  RatingData ratingData = RatingData(Get.find());
  int quantity = 1;
  MyServices myServices = Get.find();

  List<String> sizes = ["S", "M", "L", "XL"];
  StautusRequest statusRequest = StautusRequest.none;
  List<Color> colors = [
    Color.fromARGB(255, 0, 0, 0), // Black
    Color.fromARGB(255, 238, 81, 146), // White
    Color(0xFF8B4513), // Brown (SaddleBrown)
  ];
  //I don't know why to creat this list but i just follow the course instructor
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  List subItems = [
    {"name": "black", "id": "1", "active": "1"},
    {"name": "beige", "id": "2", "active": "1"},
    {"name": "brown", "id": "3", "active": "0"},
  ];
  ProductsControllerImp productsControllerImp =
      Get.find<ProductsControllerImp>();

  ProductData productData = ProductData(Get.find());
  ProductsModel productModel = Get.arguments["productDetails"];
  double? productRatingValu;
  @override
  void onInit() {
    print("--------------------------------------------------");
    print("This is the product detailsControllerImp onInit method");
    print("--------------------------------------------------");
    productRatingValu = productModel.productRating;
    initalValues();
    print("--------------------------------------------------");
    print(" The statusreques is $statusRequest }");
    super.onInit();
  }

  initalValues() async {
    statusRequest = StautusRequest.loading;
    update();
    //دة بورينا المتنج المعين مضاف كم مرة .
    productCount = await getProductCount(productModel.productsId.toString());
    statusRequest = StautusRequest.success;
    update();
  }

  //This will be used to add product to the cart
  addToCart(String productId) async {
    statusRequest = StautusRequest.loading;
    update();
    var response = await cartData.addToCart(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        // Get.snackbar("Success", "The product is added to the cart");
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update();
  }

  deleteFromCart(String productId) async {
    statusRequest = StautusRequest.loading;
    update();
    var response = await cartData.deleteFromCart(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update();
  }

  //الدالة دي بتورينا المنتج المعين دة مضاف للسل ةكم مرة .
  getProductCount(String productId) async {
    //The status will be loading because of the data will came from the server.
    statusRequest = StautusRequest.loading;
    update();

    var response = await cartData.getProductCount(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        //response['data] بترجع ليك عددالمنتجات المضافة للمفضلة من الباكند يعني ال
        //json بتاعنا شكلو عامل كدة :
        /*{"status":"success","data":2} */
        productCount = response['data'];
        //نحنا بنخلي الدالة بترجع لينا عدد المنتجات المضافة  في السلة .
        return productCount;
      } else {
        //دة بعني انو مافي منتجات مضافة للسلة .
        statusRequest = StautusRequest.failure;
      }
    }
    update();
  }

  @override
  void changeSelectedSize(String size) {
    selectedSize = size;
    update();
  }

  @override
  void changeSelctedColor(Color color) {
    selectedColor = color;
    update();
  }

  @override
  void increaseQuantity() {
    addToCart(productModel.productsId.toString());
    productCount++;
    update();
  }

  @override
  void decreaseQuantity() {
    // Prevent quantity from going below 1
    // لأنو ما منطقي المستخدم يختار 0 أو قيمة سالبة،
    // ولو حصلت حتعمل مشاكل في السلة وحساب السعر.
    if (productCount > 0) {
      deleteFromCart(productModel.productsId.toString());
      productCount--;
      update();
    }
  }
  //The rating for the product it self is not the righ behavior but i have do that just for practcing on how to do it
  //why it's not the right behavoir ?
  //Because of the goal of the shop owner or the store owner is to sell all of the products
  //so when the customer see that one product have low rating he will never buy that product.
  //So the righ place for the rating is in the order page .and it will not be displayed to the user
  //no it will be only dislayed to the shop owner  so he will know if there is an issue and will try to fix it
  //and make the user experince more better.

  //This fucntion is use to rate the product.
  //raingValue بتمثل ليك انو المنتج دة حنقيمو بي كم ؟0و1و2و3و4و5
  @override
  void rateProduct(productId, ratingValue) async {
    //The status will be loading because of the data will came from the server.
    statusRequest = StautusRequest.loading;
    update();
    var response = await ratingData.rateProduct(
      myServices.sharedPreferences.getString("user_id"),
      productId,
      ratingValue,
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        //after the user rate the product we need to get the new rating value from the db.
        //Because of the rating value will not be the raing of this user alone no we sumit the raing of all of the user and
        //get the avg.that is the rating.
        getOneProductData();
      } else if (response["status"] == "failure") {
        //In case of the status is faliure that means the user has rate this product before  with the same rating value
        //and this is wrong behavior and we shuld just display a messsage to him
        Get.snackbar(
          "No change",
          "You already rated this product with the same value.",
          icon: Icon(Icons.info_outline_rounded),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.black,
        );
      }
    }
    update();
  }

  //Why ddi we get onlyy one productdata not all of the products?because of we only rate one
  //product so there is no need to get the data of all of the products.
  getOneProductData() async {
    // print removed
    statusRequest = StautusRequest.loading;
    update();
    var response = await ratingData.getOneProductData(
      productModel.productsId.toString(),
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        productRatingValu =
            (response['data']['product_rating'] as num).toDouble();
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }
}
