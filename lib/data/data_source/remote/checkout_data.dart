import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  Future addToOrder(
    userId,
    productPrice,
    shipingPrice,
    deliveryType,
    paymentMethod,
    orderAddress,
    orderCoupon,
  ) async {
    var response = await crud.postData(AppLinkApi.addOrder, {
      "order_user_id": userId,
      "order_price": productPrice,
      "order_shiping_price": shipingPrice,
      //We have to spacify wither the user wil recive the product from the store
      //or he want it to be delivered to his address.if he chose the delivery to his address
      //the delivery type will be 0 else it will be 0
      "order_delivery_type": deliveryType,
      //The payment method could be "cash on delivery" or "credit card"
      //if the user chose cash on delivery the payment method will be 0
      //else it will be 1
      "order_payment_method": paymentMethod,
      //If the user chose the order to be diliverd to his address
      //we will put the id of the address that he chose
      //Becuase of the user may have more than one address:address of home,job,caffe...
      //otherwise if he chose to recive the order from the store
      //we will put 0
      "order_address": orderAddress,
      //If the user applied a coupon the coupon code id will be here
      //otherwise if he didn't apply any coupon the value will be 0
      "order_coupon": orderCoupon,
    });

    return response.fold((l) => l, (r) => r);
  }
}
