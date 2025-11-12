import 'package:e_commerce_halfa/controller/order/order_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/order/view_order_widgets/archived_order_list.dart';
import 'package:e_commerce_halfa/view/widgets/order/view_order_widgets/orders_list.dart';
import 'package:e_commerce_halfa/view/widgets/order/view_order_widgets/tab_bar_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 154
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
                            orderController.activeOrderList,
                            orderController,
                          ),

                          //Why did the rating of the product will be  in the archived orde?
                          //عشان نحن ما ممكن نقيم منتج ما لم نتحصل علي التجربة كاملة
                          //يعني بعد ما لامستخدم يتحصل علي المنتج بعداك يعطي رايو مثلا التغليف كان جيد لكن التوصيل اتاخر وهكذا بي كدة صاحب المتجر يقدر يحسن علي التجربة في المرة القادة
                          buildArchivedOrderList(
                            orderController.archivedOrderList,
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
