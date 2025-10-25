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
          onTap: () {
            orderController.goToOrderDetails(order);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              children: [
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
                              title: "تأكيد الإلغاء",
                              middleText:
                                  "هل أنت متأكد أنك تريد إلغاء الطلب رقم #${order.orderId}؟",

                              // زر الإلغاء
                              onCancel: () {
                                // لا يحدث شيء، يتم إغلاق مربع الحوار تلقائياً
                              },
                              textCancel: "إلغاء",
                              cancelTextColor: Colors.grey,

                              // زر التأكيد (الحذف)
                              onConfirm: () {
                                Get.back(); // إغلاق مربع الحوار
                                orderController.deleteOrder(
                                  order.orderId.toString(),
                                ); // استدعاء دالة الحذف
                              },
                              textConfirm: "تأكيد الحذف",
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
