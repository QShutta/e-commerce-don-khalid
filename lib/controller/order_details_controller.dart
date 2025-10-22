import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/order_details_data.dart';
import 'package:e_commerce_halfa/data/model/order_details_model.dart';
import 'package:e_commerce_halfa/data/model/order_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  OrderModel? orderModel;
  List<OrderDetailsModel> orderDetailsList = [];

  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  late StautusRequest statusRequest;
  // للتحكم بالخريطة
  MapController mapController = MapController();
  @override
  void onInit() {
    orderModel = Get.arguments["orderModel"];
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StautusRequest.loading;
    orderDetailsList.clear;
    update();
    var response = await orderDetailsData.getData(
      orderModel!.orderId.toString(),
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        orderDetailsList.addAll(
          response['data']
              .map<OrderDetailsModel>(
                (item) => OrderDetailsModel.fromJson(item),
              )
              .toList(),
        );
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }
}
