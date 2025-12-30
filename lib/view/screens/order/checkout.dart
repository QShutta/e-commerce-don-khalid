import 'package:e_commerce_halfa/controller/order/checkout_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/checkout/address_item_card.dart';
import 'package:e_commerce_halfa/view/widgets/checkout/custome_text_checkout.dart';
import 'package:e_commerce_halfa/view/widgets/checkout/delivery_option.dart';
import 'package:e_commerce_halfa/view/widgets/checkout/payment_option.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 137
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //دة عشان يخلي الزر قاعد في النص تحت  معناها
      //: خليه في المنتصف تحت (متمركز أسفل الشاشة)، الـ BottomAppBar.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {
            checkoutController.addOrder();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text(
            "264".tr, // Place Order
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      appBar: CustomeAppBar(
        searchTextTitle: "212".tr, // Checkout
        textColor: AppColor.primaryColor,
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: checkoutController.statusRequest,
            widget: ListView(
              children: [
                const SizedBox(height: 10),
                CustomeTextCheckout(text: "265".tr), // Choose Payment Method
                GetBuilder<CheckoutController>(
                  builder: (myInCon) {
                    return Row(
                      children: [
                        PaymentOption(
                          title: "266".tr, // Cash
                          icon: Icons.money_rounded,
                          //كيف يعني ؟
                          //the defult value of the selecdpayment is 0 if the user click on cards it will become
                          //1 and if he click on 0 again it will become 0.
                          //so if 0=0 will return true and that means the item is selected other wise it's not seleced
                          isSelected:
                              myInCon.selectedPayment == 0, //1=>cards,0=>cash
                          onTap: myInCon.onCashSelected,
                        ),
                        PaymentOption(
                          title: "267".tr, // Cards
                          icon: Icons.credit_card_rounded,
                          isSelected:
                              myInCon.selectedPayment == 1, //1=>cards,0=>cash
                          onTap: myInCon.onCardSelected,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),
                CustomeTextCheckout(text: "268".tr), // Choose Delivery Type
                GetBuilder<CheckoutController>(
                  builder: (myInCon) {
                    return Row(
                      children: [
                        DeliveryOption(
                          title: "269".tr, // Delivery
                          imagePath: ImageAssets.deliveryMan,
                          isSelected:
                              myInCon.selectedDelivery ==
                              0, //0=>deliver to his address,  1=>pick up from shop
                          onTap: myInCon.onDeliverSelected,
                        ),
                        DeliveryOption(
                          title: "270".tr, // Pick up in Store
                          imagePath: ImageAssets.reciveOnShop,
                          isSelected: myInCon.selectedDelivery == 1,
                          onTap: myInCon.onPickUpSelected,
                        ),
                      ],
                    );
                  },
                ),
                GetBuilder<CheckoutController>(
                  builder: (controller) {
                    return controller.selectedDelivery ==
                            0 //0=>deliver to his address,  1=>pick up from shop
                        ? Column(
                          children: [
                            const SizedBox(height: 30),
                            CustomeTextCheckout(
                              text: "258".tr,
                            ), // Shipping Address
                            SizedBox(height: 10),
                            HnadlingDataView(
                              stautusRequest: controller.statusRequest,
                              widget: ListView.builder(
                                itemCount: controller.addressesList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final address =
                                      controller.addressesList[index];
                                  //دة عشان نحدد العنصر الاحنا حاليا واقفين علية .
                                  //طبعا هنا نحن استخدمنا اسلوب مختلف لية ؟عشان هنا عندنا  اكتر من عنصرين
                                  final isSelected =
                                      controller.selectedAddressIndex == index;
                                  return AddressItemCard(
                                    onTap: () {
                                      controller.setSelectedAddress(
                                        index,
                                        address.addressId,
                                      );
                                    },
                                    isSelected: isSelected,
                                    title: address.addressName,
                                    subTitle:
                                        "${address.addressCity},${address.addressStreet}",
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                        : Container();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
