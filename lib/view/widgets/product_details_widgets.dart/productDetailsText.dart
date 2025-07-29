import 'package:flutter/material.dart';

class ProductDetailsText extends StatelessWidget {
  const ProductDetailsText({
    super.key,
    required this.textStyle,
    required this.text,
  });
  final String? text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        textAlign: TextAlign.start,
        text!,
        style: textStyle, //Description
      ),
    );
  }
}
