import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.whiteBackground,
        foregroundColor: Colors.black,
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        child: Icon(Icons.add),
      ),
      appBar: CustomeAppBar(
        searchTextTitle: 'Address',
        textColor: Colors.black,
      ),
      body: ListView(children: []),
    );
  }
}
