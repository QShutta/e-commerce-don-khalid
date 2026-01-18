import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This Shape Like This in Row For Example
// Best Selling                      See all
// card   card
// card   card
class RowSection extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const RowSection({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              "273".tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 19,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
