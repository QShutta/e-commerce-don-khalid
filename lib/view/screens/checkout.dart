import 'package:e_commerce_halfa/controller/checkout_controller.dart';
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
import 'package:get/get_core/src/get_main.dart';

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
      appBar: CustomeAppBar(
        searchTextTitle: 'Checkout',
        textColor: AppColor.primaryColor,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          CustomeTextCheckout(text: 'Choose Payment Method'),
          GetBuilder<CheckoutController>(
            builder: (myInCon) {
              return Row(
                children: [
                  PaymentOption(
                    title: "Cash",
                    icon: Icons.money_rounded,
                    //كيف يعني ؟
                    //the defult value of the selecdpayment is 0 if the user click on cards it will become
                    //1 and if he click on 0 again it will become 0.
                    //so if 0=0 will return true and that means the item is selected other wise it's not seleced
                    isSelected: myInCon.selectedPayment == 0,
                    onTap: myInCon.onCashSelected,
                  ),
                  PaymentOption(
                    title: "Cards",
                    icon: Icons.credit_card_rounded,
                    isSelected: myInCon.selectedPayment == 1,
                    onTap: myInCon.onCardSelected,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          CustomeTextCheckout(text: "Choose Delivery Type"),
          GetBuilder<CheckoutController>(
            builder: (myInCon) {
              return Row(
                children: [
                  DeliveryOption(
                    title: "Home Delivery",
                    imagePath: ImageAssets.deliveryMan,
                    isSelected: myInCon.selectedDelivery == 0,
                    onTap: myInCon.onDeliverSelected,
                  ),
                  DeliveryOption(
                    title: "Pick up in Store",
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
              return controller.selectedDelivery == 0
                  ? Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomeTextCheckout(text: "Shipping Address"),
                      SizedBox(height: 10),
                      HnadlingDataView(
                        stautusRequest: controller.statusRequest,
                        widget: ListView.builder(
                          itemCount: controller.addressesList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final address = controller.addressesList[index];
                            //دة عشان نحدد العنصر الاحنا حاليا واقفين علية .
                            //طبعا هنا نحن استخدمنا اسلوب مختلف لية ؟عشان هنا عندنا  اكتر من عنصرين
                            final isSelected =
                                controller.selectedAddress == index;
                            return AddressItemCard(
                              onTap: () {
                                controller.setSelectedAddress(index);
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
  }
}
