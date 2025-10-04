import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class TabBarOrder extends StatelessWidget {
  const TabBarOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        // indicator: BoxDecoration(
        //   color: AppColor.primaryColor,
        //   borderRadius: BorderRadius.circular(12),
        // ),
        labelColor: Colors.black,
        indicatorColor: AppColor.primaryColor,
        unselectedLabelColor: Colors.black87,
        tabs: const [Tab(text: "Archived"), Tab(text: "Active")],
      ),
    );
  }
}
