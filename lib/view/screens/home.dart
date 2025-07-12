import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/banner_slider.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/catogery_list.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/empower_section.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/home_text.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/top_proudcts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: homeControllerImp.statusRequest,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  BannerSlider(),
                  HomeText(text: "الأصناف"),
                  CategoryList(),
                  EmpowerSection(),
                  HomeText(text: "المنتجات الظابطة"),
                  TopProducts(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
