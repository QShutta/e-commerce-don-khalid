import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class AddressItemCard extends StatelessWidget {
  const AddressItemCard({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
    required this.subTitle,
  });
  final bool? isSelected;
  final void Function()? onTap;
  final String? title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // onTap: () {
      // controller.setSelectedAddress(index);
      // },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
        child: Card(
          color:
              isSelected!
                  ? const Color.fromARGB(255, 129, 165, 243)
                  : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color:
                  isSelected!
                      ? const Color.fromARGB(255, 2, 24, 90)
                      : Colors.grey,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              // address["title"]!,
              title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected! ? AppColor.primaryColor : Colors.black,
              ),
            ),
            // subtitle: Text(address["subtitle"]!),
            subtitle: Text(subTitle!),
            trailing:
                isSelected!
                    ? const Icon(Icons.check_circle, color: Colors.white)
                    : null,
          ),
        ),
      ),
    );
  }
}
