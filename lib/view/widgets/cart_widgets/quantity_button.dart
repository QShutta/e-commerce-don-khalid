import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    super.key,
    required this.butttonColor,
    required this.quantityButtonIcon,
    required this.onQuantaityButtonClicked,
  });
  final Color butttonColor;
  final void Function()? onQuantaityButtonClicked;
  final IconData quantityButtonIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onQuantaityButtonClicked,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: butttonColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(quantityButtonIcon, size: 18, color: butttonColor),
      ),
    );
  }
}
