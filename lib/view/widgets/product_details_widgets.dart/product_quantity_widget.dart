import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductQuantityWidget extends StatelessWidget {
  ProductQuantityWidget({super.key, required this.productId});
  final ProductDetailsControllerImp productDetailsControllerImp = Get.find();

  final CartController cartController = Get.find();
  final String? productId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              "الكمية",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.greyText,
              ),
            ),
            Spacer(),
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyText),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      productDetailsControllerImp.decreaseQuantity();
                      cartController.deleteFromCart(productId!);
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    // productDetailsControllerImp.quantity.toString(),
                    cartController.productCount.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    //            style: TextStyle(height: 3.0),
                  ),
                  IconButton(
                    onPressed: () {
                      productDetailsControllerImp.increaseQuantity();
                      cartController.addToCart(productId!);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
