import 'package:e_commerce_halfa/controller/checkout_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Choose Payment Method",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GetBuilder<CheckoutController>(
            builder: (myInCon) {
              return Row(
                children: [
                  PaymentOption(
                    title: "Cash",
                    icon: Icons.money_rounded,
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Choose Delivery Type",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
