import 'package:get/get.dart';

class CheckoutController extends GetxController {
  int selectedDelivery = 0;
  int selectedPayment = 0;

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
