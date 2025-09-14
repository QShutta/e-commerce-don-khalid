import 'package:e_commerce_halfa/controller/address_controller/view_address_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/address/address_item_list.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViewAddress extends StatelessWidget {
  ViewAddress({super.key});
  ViewAddressController viewAddressController = Get.put(
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
      appBar: CustomeAppBar(
        searchTextTitle: 'Address',
        textColor: Colors.black,
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: viewAddressController.statusRequest,
            widget: ListView.builder(
              itemCount: viewAddressController.addressList.length,
              itemBuilder: (BuildContext context, int index) {
                var address = viewAddressController.addressList[index];
                return AddressItem(
                  addressName: address.addressName!,
                  addressStreetCity:
                      '${address.addressCity},${address.addressStreet}',
                  onEdit: () {},
                  onDelete: () {},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
