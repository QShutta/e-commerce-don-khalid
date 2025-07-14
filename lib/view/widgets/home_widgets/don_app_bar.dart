import 'package:e_commerce_halfa/view/widgets/home_widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearch;
  final bool showNotification;
  void Function(String)? onChangeWhenSearh;
  final void Function()? onNotificationIconButtonClicked;
  DonAppBar({
    super.key,
    required this.title,
    this.showSearch = true,
    this.showNotification = true,
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
          showNotification
              ? IconButton(
                onPressed: onNotificationIconButtonClicked,
                icon: const Icon(Icons.notifications_outlined, size: 30),
              )
              : null,
      actions:
          showSearch
              ? [
                IconButton(
                  onPressed: () {
                    Get.to(SearchPage(onChangeWhenSearh: onChangeWhenSearh));
                  },
                  icon: const Icon(Icons.search_outlined, size: 30),
                ),
              ]
              : null,
    );
  }
}
