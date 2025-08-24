import 'package:e_commerce_halfa/controller/cart_controller.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartCont});
  final CartController cartCont;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartCont.cartItems.length,
      itemBuilder: (context, index) {
        final product = cartCont.cartItems[index];
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
            cartCont.removeItemFromCart(index);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${product['title']} removed from cart")),
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
            productTitle: product["title"],
            productPrice: "\$${product["price"]}",
            productImage: Image.asset(product["image"]),
            count: product["count"],
            onAdd: () {
              cartCont.incrementItem(index);
            },
            onRemove: () {
              cartCont.decrementItem(index);
            },
          ),
        );
      },
    );
  }
}
