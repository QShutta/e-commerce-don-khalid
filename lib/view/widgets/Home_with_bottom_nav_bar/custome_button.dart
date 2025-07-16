import 'package:flutter/material.dart';

class CustomeButtonForBottomNavBar extends StatelessWidget {
  const CustomeButtonForBottomNavBar({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final void Function()? onTap;
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
        // أو ياخد مساحة على قد المحتوى فقط (min)
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}
