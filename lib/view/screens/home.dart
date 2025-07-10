import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/banner_slider.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/catogery_list.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/empower_section.dart';
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
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20.0,
                    ),
                    child: Text(
                      "الأصناف",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  CategoryList(),
                  //طبعا the text that inisde of this widget now it's dynamic
                  //and it will be changed in the future
                  //But now I just want to test the UI
                  EmpowerSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
