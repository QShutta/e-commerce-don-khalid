import 'package:e_commerce_halfa/controller/search_controller.dart';
import 'package:e_commerce_halfa/controller/search_discount_products_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/searchDiscountProductsWidgets/search_list_widget_discount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultDiscount extends StatelessWidget {
  SearchResultDiscount({super.key});

  final SearchDiscountProductsController mySearchCont =
      Get.find<SearchDiscountProductsController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<SearchDiscountProductsController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: mySearchCont.stautusRequest,
            widget:
                mySearchCont.searchResultsWithDiscount.isNotEmpty
                    ? SearchListWidgetDiscount(
                      productsList: mySearchCont.searchResultsWithDiscount,
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
