import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({
    super.key,
    required this.searchTextTitle,
    required this.textColor,
    this.showBackButton,
  });
  final String searchTextTitle;
  final Color? textColor;
  final bool? showBackButton;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        searchTextTitle,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),

      leading:
          showBackButton == true
              ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              )
              : null,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    );
  }
}
