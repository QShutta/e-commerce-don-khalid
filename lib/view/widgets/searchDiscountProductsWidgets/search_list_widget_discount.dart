import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/search_discount_products_controller.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:e_commerce_halfa/view/widgets/my_cached_network_image.dart';
import 'package:e_commerce_halfa/view/widgets/search/search_result_item.dart';
import 'package:flutter/material.dart';

class SearchListWidgetDiscount extends StatelessWidget {
  const SearchListWidgetDiscount({
    super.key,
    required this.productsList,
    required this.mySearchCont,
  });
  final List<ProductsModel> productsList;
  final SearchDiscountProductsController mySearchCont;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        final product = productsList[index];
        return SearchResultWidget(
          productTitle: translateDataBase(
            product.proudctNameEn,
            product.productNameAr,
          ),
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
