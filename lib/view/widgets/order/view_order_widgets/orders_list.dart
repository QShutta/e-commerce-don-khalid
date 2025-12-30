import 'package:e_commerce_halfa/controller/order/order_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';

Widget buildOrderList(List<OrderModel> list, OrderController orderController) {
  //In case of there is no orders will display this widget
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
          // Empty list UI
          Text(
            "241".tr, // No orders yet
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            "242".tr, // When you place orders...
            style: TextStyle(color: Colors.grey),
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
          onTap: () {
            orderController.goToOrderDetails(order);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              children: [
                //What is the benfit of this condtition?
                //The benfit of this condtion is that if the order status is still waiting for approvel we give the
                //user the ability to remove the order.but if the order status is prepering?or other status there is no way
                //to remove the order.
                order.orderStatus != 0
                    ? Container(
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
                    )
                    : Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "244".tr,
                              middleText: "245".trParams({
                                "id": order.orderId.toString(),
                              }),

                              // زر الإلغاء
                              onCancel: () {
                                // لا يحدث شيء، يتم إغلاق مربع الحوار تلقائياً
                              },
                              textCancel: "63".tr,
                              cancelTextColor: Colors.grey,

                              // زر التأكيد (الحذف)
                              onConfirm: () {
                                Get.back(); // إغلاق مربع الحوار
                                orderController.deleteOrder(
                                  order.orderId.toString(),
                                ); // استدعاء دالة الحذف
                              },
                              textConfirm: "246".tr,
                              confirmTextColor: Colors.white,
                              buttonColor: Colors.red, // لون أحمر للتنبيه
                            );
                          },
                          icon: Icon(
                            size: 18,
                            Icons.delete_outline_rounded,
                            color: AppColor.primaryColor,
                          ),
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
                              //رمز #
                              // ما عندو معنى برمجي، لكنه رمز بصري يخلي رقم الطلب واضح ومميز للمستخدم.
                              "243".trParams({"id": order.orderId.toString()}),
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
                            child: Text(
                              orderController.printOrderStatus(
                                order.orderStatus.toString(),
                              ),
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
                              Jiffy.parse(order.orderDateCreate!).fromNow(),
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
