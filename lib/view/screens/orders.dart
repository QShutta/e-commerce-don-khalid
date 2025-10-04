import 'package:e_commerce_halfa/controller/order_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    Container(
                      height: 48,
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        // indicator: BoxDecoration(
                        //   color: AppColor.primaryColor,
                        //   borderRadius: BorderRadius.circular(12),
                        // ),
                        labelColor: Colors.black,
                        indicatorColor: AppColor.primaryColor,
                        unselectedLabelColor: Colors.black87,
                        tabs: const [
                          Tab(text: "Archived"),
                          Tab(text: "Active"),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      child: TabBarView(
                        children: [
                          buildOrderList(orderController.archivedOrderList),
                          buildOrderList(orderController.activeOrderList),
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

Widget buildOrderList(List<OrderModel> list) {
  if (list.isEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Image.asset(
              ImageAssets.orderImage,
              color: AppColor.primaryColor,
              height: 72,
            ),
          ),
          const Text(
            "No orders yet",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            "When you place orders, they'll appear here",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
  return ListView.separated(
    itemCount: list.length,
    separatorBuilder: (_, __) => const SizedBox(height: 12),
    padding: const EdgeInsets.only(top: 4, bottom: 4),
    itemBuilder: (context, index) {
      final order = list[index];
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      ImageAssets.orderImage,
                      color: AppColor.primaryColor,
                      height: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Order #${order.orderId}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              "Paid",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              "${order.orderDateCreate}",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${order.orderTotalPrice}\$",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right_rounded, color: Colors.black54),
              ],
            ),
          ),
        ),
      );
    },
  );
}
