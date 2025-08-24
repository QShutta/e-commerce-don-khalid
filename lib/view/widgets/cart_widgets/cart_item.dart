import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/cart_widgets/quantity_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.productTitle,
    required this.productPrice,
    required this.onAdd,
    required this.onRemove,
    required this.productImage,
    required this.count,
  });
  final String? productTitle;
  final int? count;
  final Widget? productImage;
  final String? productPrice;
  final void Function()? onAdd;
  final void Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: productImage),
          ),

          const SizedBox(width: 20),

          // Product Name & Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productTitle!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Text(
                  productPrice!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          // Quantity Buttons
          Column(
            children: [
              QuantityButton(
                quantityButtonIcon: Icons.add,
                butttonColor: AppColor.primaryColor,
                onQuantaityButtonClicked: onAdd,
              ),
              const SizedBox(height: 5),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              QuantityButton(
                butttonColor: AppColor.greyText,
                quantityButtonIcon: Icons.remove,
                onQuantaityButtonClicked: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
