import 'package:e_commerce_halfa/view/widgets/home_widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showNotificationAndFavorite;
  final bool showSearch;
  void Function(String)? onChangeWhenSearh;
  final void Function()? onNotificationIconButtonClicked;
  DonAppBar({
    super.key,
    required this.title,
    this.showNotificationAndFavorite = true,
    this.showSearch = true,
    required this.onNotificationIconButtonClicked,
    required this.onChangeWhenSearh,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      leading:
          showSearch
              ? IconButton(
                onPressed: () {
                  Get.to(SearchPage(onChangeWhenSearh: onChangeWhenSearh));
                },
                icon: const Icon(Icons.search_outlined, size: 30),
              )
              : null,
      actions:
          showNotificationAndFavorite
              ? [
                IconButton(
                  onPressed: onNotificationIconButtonClicked,
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
