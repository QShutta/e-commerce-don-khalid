import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/cart_data.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  void changeSelectedSize(String size);
  void changeSelctedColor(Color color);
  void increaseQuantity();
  void decreaseQuantity();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  String selectedSize = '';
  Color selectedColor = Colors.black;
  int productCount = 0;
  CartData cartData = CartData(Get.find());
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

  ProductsModel productModel = Get.arguments["productDetails"];
  @override
  void onInit() {
    print("--------------------------------------------------");
    print("This is the product detailsControllerImp onInit method");
    print("--------------------------------------------------");

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
}
