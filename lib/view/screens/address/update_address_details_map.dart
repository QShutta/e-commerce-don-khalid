import 'package:e_commerce_halfa/controller/address_controller/update_address_details_map_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/address/update_address_details_map/button.dart';
import 'package:e_commerce_halfa/view/widgets/address/update_address_details_map/map.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UpdateAddressDetailsMap extends StatelessWidget {
  UpdateAddressDetailsMap({super.key});

  final UpdateAddressDetailsMapController updateAddressDetailsMapCont = Get.put(
    UpdateAddressDetailsMapController(),
  );

  @override
  Widget build(BuildContext context) {
    //Why did you prevent the user from return back?
    //Becuase when the user return from the map page to the adddressdetails page he should pass the
    //The lat,lang with him,and when move using back button will move without them which will cause error.
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomeAppBar(
          searchTextTitle: 'Update Address Details',
          textColor: Colors.black,
        ),
        body: GetBuilder<UpdateAddressDetailsMapController>(
          builder: (controller) {
            return HnadlingDataView(
              stautusRequest: controller.stautusRequest,
              widget:
                  controller.userLocation == null
                      ? SizedBox()
                      : Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                            child: AddressMapWidget(controller: controller),
                          ),
                          Positioned(
                            bottom: 50,
                            child: UpdateAddressButtonWidget(
                              controller: controller,
                            ),
                          ),
                        ],
                      ),
            );
          },
        ),
      ),
    );
  }
}
