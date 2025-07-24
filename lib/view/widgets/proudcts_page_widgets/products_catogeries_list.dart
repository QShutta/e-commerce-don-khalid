import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCatogeryList extends StatelessWidget {
  ProductCatogeryList({super.key, required this.catogeriesList});
  //From where did the catogeriesList will be filled from?
  //Once the page open the "getData" method will be called and the catogeriesList will
  //Be filled from it.
  final List<Catogeries> catogeriesList;
  final ProductsControllerImp homeControllerImp =
      Get.find<ProductsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // ثبّت ارتفاع السكروول أفقي
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catogeriesList.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final catogeries = catogeriesList[index];
          return ProductCatogeryItem(
            title: translateDataBase(
              catogeries.catogeriesNameEn,
              catogeries.catogeriesNameAr,
            ),
            imageUrl:
                "${AppLinkApi.catogeriesImageLink}/${catogeries.catogeriesImage}",
            selectedCat: index,
            catogeries: catogeriesList,
            catId: '${catogeries.catogeriesId}',
          );
        },
      ),
    );
  }
}

class ProductCatogeryItem extends GetView<ProductsControllerImp> {
  final String title;
  final String imageUrl;
  final int selectedCat;
  final List catogeries;
  final String? catId;
  MyServices myServices = Get.find();
  ProductCatogeryItem({
    required this.title,
    required this.catId,
    required this.imageUrl,
    required this.selectedCat,
    required this.catogeries,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          controller.changeSelectedCat(selectedCat, catId!);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color:
                    //❓ ليه بنحط null؟
                    // لأننا لو كتبنا
                    //color: null
                    // في TextStyle، Flutter
                    // حتستخدم اللون الافتراضي للنص
                    //(اللي جاي من الـ Theme مثلاً)
                    //، يعني ما حنغير اللون.
                    controller.selectedCat == selectedCat ? Colors.blue : null,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
