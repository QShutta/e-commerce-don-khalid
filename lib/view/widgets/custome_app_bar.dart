import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({
    super.key,
    required this.searchTextTitle,
    required this.textColor,
  });
  final String searchTextTitle;
  final Color? textColor;
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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    );
  }
}
