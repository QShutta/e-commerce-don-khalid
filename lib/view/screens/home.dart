import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/discount_products_details.dart';
import 'package:e_commerce_halfa/view/screens/row_section.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/banner_slider.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/catogery_list.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/discoun_products.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/empower_section.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/home_text.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/recommand_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return HnadlingDataView(
          stautusRequest: homeControllerImp.statusRequest,
          widget: SingleChildScrollView(
            child: Column(
              children: [
                HomeText(text: "218".tr),
                homeControllerImp.topSellingList.isEmpty
                    ? FallBackBannerSlider(
                      productList: homeControllerImp.products,
                    )
                    : BannerSlider(
                      productList: homeControllerImp.topSellingList,
                    ),
                HomeText(text: "100".tr),
                CategoryList(catogeriesList: homeControllerImp.categories),

                // homeControllerImp.ranomNum == Null
                //     ?
                EmpowerSection(body: "202".tr),

                // : SizedBox(
                //   height: 100,
                //   width: 100,
                //   child: IconButton(
                //     onPressed: () {
                //       print(
                //         "-------------- START TEXT LIST --------------",
                //       );

                //       // Check if list is not empty
                //       if (homeControllerImp.products.isNotEmpty) {
                //         // Loop through the list and print details for each item
                //         for (var item in homeControllerImp.textList) {
                //           // Note: I am assuming the property names based on your JSON keys
                //           // (usually snake_case in JSON becomes camelCase in Dart models)
                //           print("ID: ${item.settingsId}");
                //           print("Title: ${item.settingsTitle}");
                //           print("Subtitle: ${item.settingSubTitle}");
                //           print("*****************");
                //         }
                //       } else {
                //         print("The textList is empty!");
                //       }

                //       print(
                //         "--------------- END TEXT LIST ---------------",
                //       );
                //     },
                //     icon: const Icon(Icons.textsms),
                //   ),
                // ),
                // HomeText(text: "207".tr),
                RowSection(
                  text: "207".tr,
                  onTap: () {
                    Get.to(
                      () => DiscountProductsDetails(
                        productsList: homeControllerImp.products,
                      ),
                    );
                  },
                ),
                DiscountProducts(productsList: homeControllerImp.products),
                RowSection(
                  text: 'Recommandation For You',
                  onTap: () {
                    Get.toNamed(AppRoutes.recommendationSection);
                  },
                ),
                RecommandationSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
