import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class CustomeListTile extends StatelessWidget {
  const CustomeListTile({
    super.key,
    required this.titleText,
    required this.leadingIcon,
    this.tralingWidget,
    required this.onListTileClicked,
  });
  final String? titleText;
  final void Function()? onListTileClicked;
  final IconData? leadingIcon;
  final Widget? tralingWidget;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onListTileClicked,
      title: Text(titleText!),
      leading: Icon(leadingIcon, size: 30.0, color: AppColor.primaryColor),
      trailing: tralingWidget,
    );
  }
}
