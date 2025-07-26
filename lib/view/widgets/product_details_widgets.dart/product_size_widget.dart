import 'package:e_commerce_halfa/controller/product_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSizeWidget extends StatelessWidget {
  ProductSizeWidget({super.key});
  final ProductDetailsControllerImp productDetailsControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) {
        return Row(
          children: [
            Text(
              "الحجم",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.greyText,
              ),
            ),
            Spacer(),

            ...List.generate(productDetailsControllerImp.sizes.length, (index) {
              /*ماذا يفعل؟
                  يقارن بين الحجم الحالي في اللوب 
                  (sizes[index]) 
                  وبين الحجم الذي اختاره المستخدم والمحفوظ في 
                  controller.selectedSize.
                  إذا كانا متساويين → isSelected تصبح true.
                  إذا لم يكونا متساويين → isSelected تصبح false. 
                    لماذا نحتاجها؟
                    نستخدمها لتغيير شكل المربع (Container) إذا كان هو الحجم المختار.
                  */
              bool isSelected =
                  productDetailsControllerImp.selectedSize ==
                  productDetailsControllerImp.sizes[index];
              return InkWell(
                onTap: () {
                  print(
                    "user select  ${productDetailsControllerImp.sizes[index]}..",
                  );
                  productDetailsControllerImp.changeSelectedSize(
                    productDetailsControllerImp.sizes[index],
                  );
                },
                child: Container(
                  width: 35,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    //Why to use this condition?
                    //عشان لمن المستخدم يختار حجم لازم يكون لون الحجم المختار مختلف عن الباقين
                    color:
                        isSelected ? AppColor.primaryColor : Color(0xFFF1EBEC),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      productDetailsControllerImp.sizes[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
