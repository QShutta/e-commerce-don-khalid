import 'package:flutter/material.dart';

class CustomeTextCheckout extends StatelessWidget {
  const CustomeTextCheckout({super.key, required this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text!,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
