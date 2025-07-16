import 'package:flutter/material.dart';

class CustomeButtonBottomNavBar extends StatelessWidget {
  const CustomeButtonBottomNavBar({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final IconData? icon;
  final String title;
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
