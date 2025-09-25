import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/cart_item_list.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/cart_summery.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/checkout_button.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 1002
class CartPage extends StatelessWidget {
  CartPage({super.key});
  final CartController cartCont = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomeAppBar(
        searchTextTitle: "213".tr,
        textColor: AppColor.primaryColor,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(child: CartItemList()),

            CartSummery(),
            SizedBox(height: 20),
            CheckoutButton(
              buttonText: '212'.tr,
              onButtonPressed: () {
                cartCont.goToCheckOutPage();
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
