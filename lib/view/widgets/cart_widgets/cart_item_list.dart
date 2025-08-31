import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/cart_item.dart';
import 'package:e_commerce_halfa/view/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemList extends StatelessWidget {
  CartItemList({super.key});

  final CartController cartCont = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartCont) {
        return HnadlingDataView(
          stautusRequest: cartCont.statusRequest,
          widget: ListView.builder(
            itemCount: cartCont.cartDetails!.length,
            itemBuilder: (context, index) {
              final product = cartCont.cartDetails![index];
              return Dismissible(
                //ما فهمتة دة شنو ؟وحيجي من وين ؟
                // 🔑 UniqueKey(): Flutter generates a random unique ID for this widget.
                // This helps Flutter know which widget is which when rebuilding the list.
                // ⚠️ But it's temporary — it changes every time you rebuild.

                //key: UniqueKey(),

                // TODO: Replace UniqueKey with a stable key from your product data (like product.id).
                // Example:
                // key: ValueKey(product.id),
                //
                // To do this, make sure each product in your cart list has an 'id' field,
                // and pass that here instead of using UniqueKey().
                // This way, Flutter can correctly identify the same product across rebuilds.
                key: UniqueKey(), // لازم Key مختلف
                direction: DismissDirection.horizontal, // يمين أو يسار
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${product.productNameAr} removed from cart",
                      ),
                    ),
                  );
                },
                // 👇 background: this widget shows up
                // when the user swipes from LEFT ➡ RIGHT.
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                // 👇 secondaryBackground: this widget shows up
                // when the user swipes from RIGHT ➡ LEFT (the opposite direction).
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: CartItem(
                  productTitle: product.productNameAr,
                  productPrice: "\$${product.productPriceOriginal}",
                  productImage: MyCachedImage(
                    imageUrl:
                        "${AppLinkApi.productsImageLink}/${product.productImage}",
                  ),
                  count: product.productCount,
                  onAdd: () async {
                    // cartCont.incrementItem(index);
                    await cartCont.addToCart(product.productsId!.toString());
                    cartCont.refreshView();
                  },
                  onRemove: () async {
                    // cartCont.decrementItem(index);
                    await cartCont.deleteFromCart(
                      product.productsId!.toString(),
                    );
                    cartCont.refreshView();
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
