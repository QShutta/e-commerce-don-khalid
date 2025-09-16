import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/address_details_data.dart';
import 'package:e_commerce_halfa/data/model/address_model.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  StautusRequest statusRequest = StautusRequest.none;
  List<AddressModel> addressList = [];
  AddressDetailsData addressDetailsData = AddressDetailsData(Get.find());
  MyServices myServices = Get.find();

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }

  viewAddress() async {
    addressList.clear();
    statusRequest = StautusRequest.loading;
    update();
    var response = await addressDetailsData.viewAddressDetailsData(
      myServices.sharedPreferences.getString("user_id"),
    );
    statusRequest = handlingStatusRequest(response);
    update();
    //This condition to check if the response is successful from the server or not
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        addressList =
            (response['data'] as List)
                //.fromJson will convert the map to object model.
                .map((address) => AddressModel.fromJson(address))
                .toList();
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressId) {
    //اول شي بنحذو من قاعدة لبيانات .ثم نحذفو من واجهة المستخدم.
    addressDetailsData.deleteAddressDetailsData(addressId);
    //بي دة حذفناهو من ال ui
    addressList.removeWhere(
      (element) => element.addressId.toString() == addressId,
    );

    update();
  }
}
