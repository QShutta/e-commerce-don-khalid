import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class FavoriteProductItem extends StatelessWidget {
  final Widget images;
  final String texts;
  final String prices;

  final void Function()? onDeleteIconButtonClicked;

  final void Function()? onUserClickOnProduct;
  final void Function()? onFavButtonClicked;
  final int? index;
  const FavoriteProductItem({
    super.key,
    required this.index,
    required this.onDeleteIconButtonClicked,
    required this.images,
    required this.texts,
    required this.prices,
    this.onUserClickOnProduct,
    this.onFavButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onUserClickOnProduct,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: images,
                    ),
                  ),
                ),
                Text(style: TextStyle(color: AppColor.greyText), texts),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onDeleteIconButtonClicked,
                      icon: Icon(Icons.delete_outline),
                    ),
                    Text(
                      "\$$prices",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
