import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductQuantityWidget extends StatelessWidget {
  ProductQuantityWidget({super.key});
  final ProductDetailsControllerImp productDetailsControllerImp = Get.find();
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
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    productDetailsControllerImp.quantity.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  IconButton(
                    onPressed: () {
                      productDetailsControllerImp.increaseQuantity();
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
