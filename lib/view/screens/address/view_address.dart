import 'package:e_commerce_halfa/controller/address_controller/view_address_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/address/view_address/list_of_address.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  ViewAddress({super.key});
  final ViewAddressController viewAddressController = Get.put(
    ViewAddressController(),
  );
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
      appBar: CustomeAppBar(searchTextTitle: '609'.tr, textColor: Colors.black),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: viewAddressController.statusRequest,
            widget: ListOfAddress(),
          );
        },
      ),
    );
  }
}
