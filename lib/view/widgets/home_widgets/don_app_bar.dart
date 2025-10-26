import 'package:flutter/material.dart';

class DonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showFavoirte;
  final bool showOffers;

  final bool showSearch;
  final Color? textColor;
  final Color? myColor;
  final Color? offerButtonColor;
  final void Function()? onFavoriteButtonPressed;
  final void Function()? onNotificationIconButtonClicked;
  final void Function()? onDiscountIconButtonClicked;
  final void Function()? onFirstSearchButtonClicked;

  const DonAppBar({
    super.key,
    required this.title,
    this.textColor,
    this.offerButtonColor,
    this.myColor,
    this.showFavoirte = true,
    this.showOffers = true,
    this.showSearch = true,
    this.onNotificationIconButtonClicked,
    this.onFavoriteButtonPressed,
    this.onDiscountIconButtonClicked,
    this.onFirstSearchButtonClicked,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white),
      backgroundColor: myColor,
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      leading:
          showSearch
              ? IconButton(
                onPressed: onFirstSearchButtonClicked,
                icon: const Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              )
              : null,
      actions: [
        showFavoirte
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: onFavoriteButtonPressed,
                icon: const Icon(Icons.favorite_border_outlined, size: 30),
              ),
            )
            : Container(),
        showOffers
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: onDiscountIconButtonClicked,
                icon: Icon(
                  Icons.discount_outlined,
                  size: 30,
                  color: offerButtonColor,
                ),
              ),
            )
            : Container(),
      ],
    );
  }
}
