import 'package:e_commerce_halfa/controller/order/order_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/data/model/order_model.dart';
import 'package:e_commerce_halfa/view/widgets/order/view_order_widgets/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jiffy/jiffy.dart';

//Why did you build this file?
//Becuase of there is a diff between the normal order list and the archived order list is that in the
//archived order list.we have to add rating button.so that after the user get the order .he can rate the entrie experince.
//There is a nother way to achive that instead of creating seprate list.Is that checking order_status
//if it's archived will display like a column responsible from rating.other wise it will not be displayed
//لكن انا اخترت اريح دماغي
//and build seprate list.

Widget buildArchivedOrderList(
  List<OrderModel> list,
  OrderController orderController,
) {
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

          // Empty list UI (translated)
          Text(
            "241".tr, // No orders yet
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            "242".tr, // When you place orders, they'll appear here
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  return GetBuilder<OrderController>(
    builder: (orderCont) {
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10,
                ),
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
                                  "243".trParams({
                                    "id": order.orderId.toString(),
                                  }), // Order #@id
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomeRatingDialog(
                                        orderId: order.orderId.toString(),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.rate_review_outlined,
                                  size: 20,
                                  color: AppColor.primaryColor,
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
                                  style: const TextStyle(
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
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
