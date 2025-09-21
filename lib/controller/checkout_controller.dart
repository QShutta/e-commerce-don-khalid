import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/address_details_data.dart';
import 'package:e_commerce_halfa/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  //سالب واحد معناها المستخدم لسة ما اختار ولا حاجة .
  int selectedDelivery = -1;
  int selectedPayment = -1;

  /// `-1` means no address is selected yet.
  /// If we set this to `0`, it will auto-select the first address by default.
  /// Use `-1` when you want the user to explicitly choose an address.
  int selectedAddress = -1;
  MyServices myServices = Get.find();

  StautusRequest statusRequest = StautusRequest.none;
  AddressDetailsData addressDetailsData = AddressDetailsData(Get.find());
  List<AddressModel> addressesList = [];
  //الدالة دي حتستلم القيمة بتاعت ال index
  //the user selct in the list and set it as the selectedaddress.
  void setSelectedAddress(int index) {
    selectedAddress = index;
    update();
  }

  // --- Payment methods ---
  void onCashSelected() {
    selectedPayment = 0;
    update(); // tells GetBuilder to rebuild
  }

  void onCardSelected() {
    selectedPayment = 1;
    update();
  }

  // --- Delivery methods ---
  void onDeliverSelected() async {
    //دة عشان نغير شكل الزر يدل علي انو
    //selected
    selectedDelivery = 0;
    getShippingAddress();
    update();
  }

  void onPickUpSelected() {
    selectedDelivery = 1;
    update();
  }

  getShippingAddress() async {
    addressesList.clear();
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
        addressesList =
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
}
