import 'package:e_commerce_halfa/core/class/stautus_request.dart';
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
  List<OrderModel> ordersList = [];
  List<OrderModel> activeOrderList = [];
  List<OrderModel> archivedOrderList = [];
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getString("user_id");
    getOrder();
    super.onInit();
  }

  getOrder() async {
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
}
