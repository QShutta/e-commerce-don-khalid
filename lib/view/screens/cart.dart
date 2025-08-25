import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/cart_item_list.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/cart_summery.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/checkout_button.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 1002
class CartPage extends StatelessWidget {
  CartPage({super.key});
  final CartController cartCont = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(
        title: "213".tr,
        showNotificationAndFavorite: false,
        showSearch: false,
        textColor: AppColor.primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: GetBuilder<CartController>(
              builder: (cartCont) {
                return CartItemList(cartCont: cartCont);
              },
            ),
          ),

          CartSummery(),
          SizedBox(height: 20),
          CheckoutButton(buttonText: '212'.tr, onButtonPressed: () {}),
        ],
      ),
    );
  }
}
