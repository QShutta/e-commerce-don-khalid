import 'package:e_commerce_halfa/view/widgets/home_widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DonAppBar({super.key});
  // ✅ We implement PreferredSizeWidget because the Scaffold's appBar property
  //    only accepts widgets that implement this interface.
  // 📏 The PreferredSizeWidget requires us to define the preferredSize,
  //    which tells Flutter how much vertical space this widget needs.
  // 🟩 In our case, we return kToolbarHeight (56.0 by default), which is the
  //    standard AppBar height in Flutter.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // your app bar widget code here
    return AppBar(
      title: Center(
        child: Text(
          'Don Shop',
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined, size: 30),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(SearchPage());
          },
          icon: const Icon(Icons.search_outlined, size: 30),
        ),
      ],
    );
  }
}
