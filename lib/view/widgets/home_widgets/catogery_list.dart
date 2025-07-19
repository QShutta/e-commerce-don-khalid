import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/catogery_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key, required this.catogeriesList});
  //From where did the catogeriesList will be filled from?
  //Once the page open the "getData" method will be called and the catogeriesList will
  //Be filled from it.
  final List<Catogeries> catogeriesList;
  final HomeControllerImp homeControllerImp = Get.find<HomeControllerImp>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // ثبّت ارتفاع السكروول أفقي
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catogeriesList.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          final catogeries = catogeriesList[index];
          return CategoryItem(
            title: catogeries.catogeriesNameAr!,
            imageUrl:
                "${AppLinkApi.catogeriesImageLink}/${catogeries.catogeriesImage}",
            selectedCat: index,
            catogeries: catogeriesList,
          );
        },
      ),
    );
  }
}
