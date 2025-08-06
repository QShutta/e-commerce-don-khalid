import 'package:e_commerce_halfa/controller/fav_controller.dart';
import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/loading_widget.dart';
import 'package:e_commerce_halfa/view/widgets/proudcts_page_widgets/products_catogeries_list.dart';
import 'package:e_commerce_halfa/view/widgets/proudcts_page_widgets/products_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 83.
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
        onFavoriteButtonPressed: () {
          productsController.goToFavoritePage();
        },
      ),
      body: Scaffold(
        body: GetBuilder<ProductsControllerImp>(
          builder: (_) {
            return ListView(
              children: [
                ProductCatogeryList(
                  catogeriesList: productsController.catogeriesList!,
                ),
                HnadlingDataView(
                  stautusRequest: productsController.statusRequest,
                  optionalLoadingWidget: SizedBox(
                    height:
                        600, // أو خليها MediaQuery.of(context).size.height * 0.4
                    child: Center(child: LoadingWidget()),
                  ),
                  widget: ProductsGridWidget(
                    productList: productsController.producstsLis!,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
