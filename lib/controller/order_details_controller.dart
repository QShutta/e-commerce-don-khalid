import 'package:e_commerce_halfa/data/model/order_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  OrderModel? orderModel;

  // للتحكم بالخريطة
  MapController mapController = MapController();
  @override
  void onInit() {
    orderModel = Get.arguments["orderModel"];
    print("-----------------------------------------");
    print(orderModel!.orderDateCreate);
    print("-----------------------------------------");
    super.onInit();
  }
}
