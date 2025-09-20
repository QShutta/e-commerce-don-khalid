import 'package:get/get.dart';

class CheckoutController extends GetxController {
  int selectedDelivery = 0;
  int selectedPayment = 0;

  /// `-1` means no address is selected yet.
  /// If we set this to `0`, it will auto-select the first address by default.
  /// Use `-1` when you want the user to explicitly choose an address.
  int selectedAddress = -1;
  List<Map<String, String>> addressesList = [
    {"title": "Home", "subtitle": "123 Street, City"},
    {"title": "Work", "subtitle": "Office 5, Business Center"},
    {"title": "Other", "subtitle": "Friend's place"},
  ];
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
  void onDeliverSelected() {
    selectedDelivery = 0;
    update();
  }

  void onPickUpSelected() {
    selectedDelivery = 1;
    update();
  }
}
