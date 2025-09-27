import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/address_details_data.dart';
import 'package:e_commerce_halfa/data/data_source/remote/checkout_data.dart';
import 'package:e_commerce_halfa/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  //This to choose if it's -1 that means the user did n't select anythin yet
  //If it's 0 that means the user chose the delivery to home
  //If it's 1 that means the user chose to recive the product from the shop
  int selectedDelivery = -1;
  //This to choose if it's -1 that means the user did n't select anythin yet
  //If it's 0 that means the user chose to pay by cash
  //If it's 1 that means the user chose to pay by card
  int selectedPayment = -1;
  double? subTotoalPrice;
  //This to store the coupon id that the user chose it in the coupon page
  //If it's null that means the user did n't choose any coupon
  //If it's not null that means the user chose a coupon and this is the id of this coupon
  int? couponId;
  CheckoutData checkoutData = CheckoutData(Get.find());

  /// `-1` means no address is selected yet.
  /// If we set this to `0`, it will auto-select the first address by default.
  /// Use `-1` when you want the user to explicitly choose an address.
  int selectedAddressIndex = -1;
  //There is a diff between of the selectedAddress and the selectedAddressId
  //The selectedAddressIndex is the index of the address in the list we use it
  //to know which address the user selected by putting spacfic color to the selectedAddress
  //The selectedAddressId is the id of the address in the database we use it to send it to the server
  //to know to which address we will deliver the product ?Wither it will be the address of the home,job,caffee...
  int? selectedAddressId = -1;
  MyServices myServices = Get.find();

  StautusRequest statusRequest = StautusRequest.none;
  AddressDetailsData addressDetailsData = AddressDetailsData(Get.find());
  List<AddressModel> addressesList = [];

  addOrder() async {
    if (selectedPayment == -1) {
      Get.snackbar(
        "اشعار",
        " يرجى اختيار طريقة الدفع",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (selectedDelivery == -1) {
      Get.snackbar(
        "اشعار",
        "يرجي اختيار طريقة استلام المنتج",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    //Why did you add this condition?
    //To make sure if the user select the delivery type is to be deliverd to him not to recive on store
    //That he should select one of the addresses that we have
    //Otherwise if he did n't select any address and he try to add the order
    //We will show him a message to select one of the addresses
    //and prevent him from adding the order
    if (selectedDelivery == 0 && selectedAddressId == -1) {
      Get.snackbar(
        "اشعار",
        "يرجي اختيار عنوان من العناوين المسجلة",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    statusRequest = StautusRequest.loading;
    //Why did you make all of them .toString()?
    //to avoid the eror of type mismatch
    var response = await checkoutData.addToOrder(
      myServices.sharedPreferences.getString("user_id"),
      subTotoalPrice!.toString(),
      "2323",
      selectedDelivery.toString(),
      selectedPayment.toString(),
      selectedAddressId.toString(),
      couponId.toString(),
    );
    statusRequest = handlingStatusRequest(response);

    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        print("-------------------------------");

        Get.snackbar(
          "اشعار",
          "تمت إضافة الطلب بنجاح",
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(AppRoutes.home);
      } else {
        statusRequest = StautusRequest.failure;
      }
    } else {
      Get.snackbar(
        "اشعار",
        "حدث خطأ ما. يرجى المحاولة مرة أخرى.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onInit() {
    subTotoalPrice = Get.arguments['subTotalPrice'];
    couponId = int.parse(Get.arguments['couponId']);

    super.onInit();
  }

  //I think there is an error here?
  //we want the id of the address not the index of the address
  void setSelectedAddress(index, idOfSelectedAddress) {
    selectedAddressIndex = index;
    selectedAddressId = idOfSelectedAddress;
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
    //if the selctedDeivery is 0 that means the user chose that the product will be diliverd to home
    //else if it is 1 that means the user chose to recive the product from the shop
    selectedDelivery = 0;
    getShippingAddress();
    update();
  }

  void onPickUpSelected() {
    selectedDelivery = 1;
    //If the user chose to pick up the product from the shop
    //we will will put the selectedAddressId to 0 that means there is no address
    //because the user will pick up the product from the shop not to be diliverd to his address
    selectedAddressId = 0;
    update();
  }

  //What is the job of this fun?
  //This function will get the shipping address of the user from the server
  //What did we mean by shipping address?They are the addres that we can delivery the product to the user
  //on like:home,job,caffe
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
