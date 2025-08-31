import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 106
class AddToCartButton extends StatelessWidget {
  AddToCartButton({super.key});
  final ProductDetailsControllerImp productCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      // margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
      //Why did you put this white color?xxxxxxxxxxxxxxxxxxxxxx
      color: Colors.white,
      child: ElevatedButton(
        onPressed: () async {
          //مفترض اول ما نفتح صفحة ال
          //cart
          // لازم
          //نجيب اخر بيانات قاعدة في الصفحة بتاعت ال
          //cart.
          // productCont.cartCont.refreshView();
          await Get.toNamed(AppRoutes.cart);
          //لمن المستخدم يمشي صفحة ال
          //cart and make some changes like increase the quantity of the product in the cart or remove the product
          //from the cart when the user navigatee back these changes that he made should be reflected in the
          //Ui so we call the initalValues again.
          productCont.initalValues();
        },
        style: ElevatedButton.styleFrom(
          // backgroundColor: AppColor.begie, // Use primary color for the button
          backgroundColor: Color.fromARGB(255, 208, 230, 247),
          // backgroundColor: Color.fromARGB(255, 154, 204, 243),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: Text(
          "209".tr,
          style: TextStyle(
            color: AppColor.darkGrey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
