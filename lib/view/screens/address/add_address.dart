import 'package:e_commerce_halfa/controller/address_controller/add_address_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/screens/address/map_button.dart';
import 'package:e_commerce_halfa/view/widgets/address/add_address/address_map.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  AddAddress({super.key});

  final AddAddressController addAddressCont = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        searchTextTitle: 'Address Add',
        textColor: Colors.black,
      ),

      body: GetBuilder<AddAddressController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: addAddressCont.stautusRequest,
            widget:
                //We add this condition to avoid the error of :null check operator used on null value
                //When the page open it take a time to get the user location this time we dispalpyp to the user
                //empty sized box.
                addAddressCont.userLocation == null
                    ? SizedBox()
                    : Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(child: AddressMap()),
                        Positioned(
                          bottom: 50,
                          child: MapButton(
                            onButtonClick: () {
                              addAddressCont.goToAddressDetailsPage();
                            },
                            buttonText: "Add Details",
                          ),
                        ),
                      ],
                    ),
          );
        },
      ),
    );
  }
}
