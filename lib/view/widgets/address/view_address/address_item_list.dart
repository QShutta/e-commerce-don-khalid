import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.addressName,
    required this.addressStreetCity,
    required this.onEdit,
    required this.onDelete,
    this.icon,
  });

  final String addressName; // Home, Work, Gym
  final String addressStreetCity; // 1234 Elm Street, Springfield
  final VoidCallback onEdit; // callback edit
  final VoidCallback onDelete; // callback delete
  final IconData? icon; // optional icon for address type

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon for address type
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon ?? Icons.location_on,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(width: 12),

          // Address name + street/city
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  addressStreetCity,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          // Edit + Delete buttons
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined, color: AppColor.primaryColor),
                onPressed: onEdit,
                tooltip: 'Edit Address',
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red),
                onPressed: onDelete,
                tooltip: 'Delete Address',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
