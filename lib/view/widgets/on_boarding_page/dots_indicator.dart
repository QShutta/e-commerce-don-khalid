import 'package:e_commerce_halfa/controller/on_boarding_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/data/data_source/static_data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// We use StatelessWidget instead of GetView here
// because we are not using the built-in `controller` from GetView.
// We're already using GetBuilder, which fetches the controller
// and updates the UI when needed.
// So using GetView in this case is unnecessary.
class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(onboardingList.length, (index) {
              return AnimatedContainer(
                height: 6,
                // هنا بنغير عرض
                //(width)
                //النقطة حسب الصفحة الحالية:
                // إذا كانت النقطة تمثل الصفحة الحالية
                //(currentPage)،
                //بنخليها أعرض
                //(20)
                // عشان تبرز وتوضح للمستخدم إنه في الصفحة دي حالياً.
                // أما باقي النقاط فبنخليها ضيقة (6) عشان تبان كأنها مؤشرات فقط.
                width: controller.currentPage == index ? 20 : 6,
                margin: EdgeInsets.all(3),
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
