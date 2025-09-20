import 'package:flutter/material.dart';

class DonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showNotificationAndFavorite;
  final bool showSearch;
  final Color? textColor;
  final Color? myColor;
  final void Function()? onFavoriteButtonPressed;
  final void Function()? onNotificationIconButtonClicked;

  final void Function()? onFirstSearchButtonClicked;

  const DonAppBar({
    super.key,
    required this.title,
    this.textColor,
    this.myColor,
    this.showNotificationAndFavorite = true,
    this.showSearch = true,
    this.onNotificationIconButtonClicked,
    this.onFavoriteButtonPressed,
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
      actions:
          showNotificationAndFavorite
              ? [
                IconButton(
                  onPressed: onFavoriteButtonPressed,
                  icon: const Icon(Icons.favorite_border_outlined, size: 30),
                ),
                IconButton(
                  onPressed: onNotificationIconButtonClicked,
                  icon: const Icon(Icons.notifications_outlined, size: 30),
                ),
              ]
              : null,
    );
  }
}
