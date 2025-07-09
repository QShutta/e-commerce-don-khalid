import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/banner_slider.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/catogery_list.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/empower_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(),
      body: SingleChildScrollView(
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
            EmpowerSection(),
          ],
        ),
      ),
    );
  }
}
