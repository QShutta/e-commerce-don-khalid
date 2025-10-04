import 'package:e_commerce_halfa/controller/order/order_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/order/view_order_widgets/orders_list.dart';
import 'package:e_commerce_halfa/view/widgets/order/view_order_widgets/tab_bar_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 147
class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({super.key});
  final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<OrderController>(
            builder: (controller) {
              return HnadlingDataView(
                stautusRequest: orderController.stautusRequest,
                widget: Column(
                  children: [
                    //This is a tab bar to switch between the archived orders and the active orders
                    TabBarOrder(),
                    SizedBox(height: 12),
                    Expanded(
                      child: TabBarView(
                        children: [
                          buildOrderList(
                            orderController.archivedOrderList,
                            orderController,
                          ),
                          buildOrderList(
                            orderController.activeOrderList,
                            orderController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
