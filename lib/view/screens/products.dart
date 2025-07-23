import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/proudcts_page_widgets/products_catogeries_list.dart';
import 'package:e_commerce_halfa/view/widgets/proudcts_page_widgets/products_grid_widget.dart';
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
            return ListView(
              children: [
                ProductCatogeryList(
                  catogeriesList: productsController.catogeriesList!,
                ),
                ProductsGridWidget(
                  productList: productsController.producstsLis!,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
