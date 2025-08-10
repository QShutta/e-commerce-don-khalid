import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductColorsWidget extends StatelessWidget {
  ProductColorsWidget({super.key});
  final ProductDetailsControllerImp productDetailsControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              "اللون",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.greyText,
              ),
            ),
            Spacer(),

            ...List.generate(productDetailsControllerImp.colors.length, (
              index,
            ) {
              //الشرط دة عشان يخلي اللو ن التم اختيارو يكون عندو شكل مختلف عن بقية الالوان.
              var isSelected =
                  productDetailsControllerImp.selectedColor ==
                  productDetailsControllerImp.colors[index];
              return InkWell(
                onTap: () {
                  productDetailsControllerImp.changeSelctedColor(
                    productDetailsControllerImp.colors[index],
                  );
                },
                child: Container(
                  //this will represen the space between of the circlueravter(color) and the outline border.
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          isSelected == true
                              ? const Color.fromARGB(255, 250, 206, 97)
                              : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: productDetailsControllerImp.colors[index],
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
