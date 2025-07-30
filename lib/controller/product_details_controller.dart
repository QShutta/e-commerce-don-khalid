import 'dart:ui';

import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  void changeSelectedSize(String size);
  void changeSelctedColor(Color color);
  void increaseQuantity();
  void decreaseQuantity();
  void addToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  String selectedSize = '';
  Color selectedColor = Colors.black;
  int quantity = 1;
  List<String> sizes = ["S", "M", "L", "XL"];
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
    print(" The product details are ${productModel.productNameAr}");
    super.onInit();
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
    quantity++;
    update();
  }

  @override
  void decreaseQuantity() {
    // Prevent quantity from going below 1
    // لأنو ما منطقي المستخدم يختار 0 أو قيمة سالبة،
    // ولو حصلت حتعمل مشاكل في السلة وحساب السعر.
    if (quantity > 1) {
      quantity--;
      update();
    }
  }

  @override
  void addToCart() {
    // Logic to add the product to the cart
    // This could involve calling a service or updating a cart model
    print(
      'Product added to cart with size: $selectedSize, color: $selectedColor, quantity: $quantity',
    );
    update();
  }
}
