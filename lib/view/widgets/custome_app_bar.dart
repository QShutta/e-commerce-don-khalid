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
      //لو عايز شكل الـ
      //AppBar
      // يندمج تمامًا مع الصفحة بدون أي حدود سفلية، أضف
      //surfaceTintColor: Colors.transparent
      surfaceTintColor: Colors.transparent,
      title: Text(
        searchTextTitle,
        style: TextStyle(
          shadows: [
            Shadow(
              offset: Offset(1, 1), // اتجاه الظل (يمين وتحت)
              blurRadius: 2.0, // درجة الضبابية
              color: Colors.black.withOpacity(0.5), // لون الظل
            ),
          ],
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
