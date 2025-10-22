import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/view_order_data.dart';
import 'package:e_commerce_halfa/data/model/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  String? userId;
  MyServices myServices = Get.find();
  StautusRequest stautusRequest = StautusRequest.none;
  ViewOrderData viewOrderData = ViewOrderData(Get.find());
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
    super.onInit();
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
    var response = await viewOrderData.getData(userId!);
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

  goToOrderDetails(orderModel) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {"orderModel": orderModel});
  }
}
