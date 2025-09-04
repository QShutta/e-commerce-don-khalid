import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/search_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:e_commerce_halfa/view/widgets/my_cached_network_image.dart';
import 'package:e_commerce_halfa/view/widgets/search/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});

  final MySearchCont mySearchCont = Get.find<MySearchCont>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<MySearchCont>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: mySearchCont.stautusRequest,
            widget:
                mySearchCont.searchResults.isNotEmpty
                    ? SearchListWidget(
                      productsList: mySearchCont.searchResults,
                      mySearchCont: mySearchCont,
                    )
                    : Container(
                      margin: EdgeInsets.only(top: 250),
                      child: const Center(child: Text("بتفتش في شنو ؟")),
                    ),
          );
        },
      ),
    );
  }
}

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({
    super.key,
    required this.productsList,
    required this.mySearchCont,
  });
  final List<ProductsModel> productsList;
  final MySearchCont mySearchCont;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        final product = productsList[index];
        return SearchResultWidget(
          productTitle: product.productNameAr,
          productPrice: "\$${product.productPrice}",
          productImage: MyCachedImage(
            imageUrl: "${AppLinkApi.productsImageLink}/${product.productImage}",
          ),
          onUserClickOnProductInSearch: () {
            mySearchCont.goToProductDetails(product);
          },
        );
      },
    );
  }
}
