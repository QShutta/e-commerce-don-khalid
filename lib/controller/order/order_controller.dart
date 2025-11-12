import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/view_order_data.dart';
import 'package:e_commerce_halfa/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  String? userId;
  MyServices myServices = Get.find();
  TextEditingController? ratingCommentController;
  //This value is created to save the rating value on it.
  double ratingValue = 0;
  StautusRequest stautusRequest = StautusRequest.none;
  ViewOrderData orderData = ViewOrderData(Get.find());
  //Here we will store all of the orders wither they are active or archived
  List<OrderModel> ordersList = [];
  //Here we will store only the active orders
  List<OrderModel> activeOrderList = [];
  //Here we will store only the archived orders
  List<OrderModel> archivedOrderList = [];

  //Once the page open i have to displa the order
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getString("user_id");
    getOrder();
    ratingCommentController = TextEditingController();
    super.onInit();
  }

  setRatingValue(val) {
    ratingValue = val;
    update();
  }

  //This to specfy the order status in a human readable format
  //Instead of showing 1,2,3,4 we will show pending,shipping,delivered,archived
  String printOrderStatus(String value) {
    switch (value) {
      case "0":
        return "Pending Approval"; // قيد انتظار الموافقة
      case "1":
        return "Preparing"; // قيد التحضير
      case "2":
        return "Shipping"; // قيد التوصيل
      case "3":
        return "Delivered"; // تم التوصيل
      case "4":
        return "Archived"; // أرشيف
      default:
        return "Unknown";
    }
  }

  //This method will be used to get all of the orders from the api
  getOrder() async {
    //Before getting the orders we have to clear the lists
    //To avoid duplicating the orders in the list
    activeOrderList.clear();
    archivedOrderList.clear();
    ordersList.clear();
    stautusRequest = StautusRequest.loading;
    update();
    var response = await orderData.getData(userId!);
    stautusRequest = handlingStatusRequest(response);
    // print removed
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        //The orderList will contain all of the orders wither they are active or archived.
        ordersList =
            (response['data'] as List)
                //.fromJson will convert the map to object model.
                .map((order) => OrderModel.fromJson(order))
                .toList();
        //To get the active orders we do check operation
        //if the orderstatus is less than 4 that means it maybe either :pending,shiping,deliverd
        //Otherwise it will be archived.
        activeOrderList =
            ordersList.where((order) => order.orderStatus! < 4).toList();
        archivedOrderList =
            ordersList.where((order) => order.orderStatus! >= 4).toList();
      } else {
        stautusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }

  deleteOrder(orderId) async {
    ordersList.clear();
    stautusRequest = StautusRequest.loading;
    update();
    var response = await orderData.deleteOrder(orderId, userId!);
    stautusRequest = handlingStatusRequest(response);
    // print removed
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        // 1. Show Success Message (e.g., using Get.snackbar or Flutter's SnackBar)
        Get.snackbar(
          "نجاح",
          "تم إلغاء الطلب بنجاح.",
          snackPosition: SnackPosition.BOTTOM,
          // **تعديل الألوان هنا**
          backgroundColor: Colors.green.shade600, // درجة أخضر واضحة
          colorText: Colors.white, // نص أبيض للوضوح على الخلفية الخضراء
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          ), // إضافة أيقونة لتعزيز المعنى
        );

        //orderList is list contain all of the orders that the user made.
        ordersList.removeWhere((order) => order.orderId == orderId);
        ordersList.clear();
        getOrder();
      } else {
        Get.snackbar(
          "خطأ",
          "لا يمكن إلغاء الطلب. يرجى التأكد من أن حالة الطلب هي 'قيد الانتظار'.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.withOpacity(
            0.7,
          ), // Use a warning color
        );
      }
    }
    update(); //This will update the UI
  }

  goToOrderDetails(orderModel) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {"orderModel": orderModel});
  }

  orderRating(orderId, ratingValue, ratingComment) async {
    //The status will be loading because of the data will came from the server.
    stautusRequest = StautusRequest.loading;
    update();
    var response = await orderData.rateOrder(
      orderId,
      myServices.sharedPreferences.getString("user_id")!,
      ratingValue,
      ratingComment,
    );
    stautusRequest = handlingStatusRequest(response);
    update();
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        //We clear the textform so that when the user submit and open it again it will be empty.
        ratingCommentController!.clear();
        Get.back();
        Get.snackbar(
          "نجاح",
          "تم إرسال التقييم بنجاح.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade600, // درجة أخضر واضحة
          colorText: Colors.white, // نص أبيض للوضوح على الخلفية الخضراء
          icon: const Icon(
            Icons.star_rate, // أيقونة نجمة بدل أيقونة الإلغاء
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3), // مدة العرض
        );
      } else if (response["status"] == "failure") {
        ratingCommentController!.clear();

        Get.back();
        //In case of the status is faliure that means the user has rate this product before  with the same rating value
        //and this is wrong behavior and we shuld just display a messsage to him
        Get.snackbar(
          "Duplicate Rating",
          "You’ve already rated this order with the same value. Please change the rating or your comment before submitting again.",
          icon: Icon(Icons.info_outline_rounded),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.black,
        );
      }
    }
    update();
  }
}
