import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/catogery_list.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/proudcts_page_widgets/products_catogeries_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});
  //Before of 69
  final ProductsControllerImp productsController = Get.put(
    ProductsControllerImp(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(
        title: 'Products',
        onNotificationIconButtonClicked: () {},
        onChangeWhenSearh: (String) {},
      ),
      body: Scaffold(
        body: GetBuilder<ProductsControllerImp>(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProductCatogeryList(
                  catogeriesList: productsController.catogeriesList!,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
