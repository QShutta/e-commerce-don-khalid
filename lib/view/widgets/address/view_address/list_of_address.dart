import 'package:e_commerce_halfa/controller/address_controller/view_address_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/widgets/address/view_address/address_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfAddress extends StatelessWidget {
  ListOfAddress({super.key});
  final ViewAddressController viewAddressController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewAddressController.addressList.length,
      itemBuilder: (BuildContext context, int index) {
        var address = viewAddressController.addressList[index];
        //This is another custome widget.that i have build.
        return AddressItem(
          addressName: address.addressName!,
          addressStreetCity: '${address.addressCity},${address.addressStreet}',
          onEdit: () {
            //When moving from the view address page to update addres page i need
            //to pass the data to the update page so that the user
            //will have his old data in his yea and can let what he want to let and
            //update what he want to update.
            Get.toNamed(
              AppRoutes.updateAddressDetails,
              arguments: {"addressDetails": address},
            );
          },
          onDelete: () async {
            await viewAddressController.deleteAddress(
              address.addressId.toString(),
            );
          },
        );
      },
    );
  }
}
