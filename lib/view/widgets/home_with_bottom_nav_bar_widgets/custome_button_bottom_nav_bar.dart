import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class CustomeButtonBottomNavBar extends StatelessWidget {
  const CustomeButtonBottomNavBar({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.active,
  });
  final void Function()? onTap;
  final IconData? icon;
  final String title;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
        // أو ياخد مساحة على قد المحتوى فقط (min)
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.primaryColor : AppColor.grey800,
          ),
          Text(
            title,
            style: TextStyle(
              color: active == true ? AppColor.primaryColor : AppColor.grey800,
            ),
          ),
        ],
      ),
    );
  }
}
