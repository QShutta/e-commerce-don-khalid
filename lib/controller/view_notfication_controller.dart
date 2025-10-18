import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/view_notfication_data.dart';
import 'package:e_commerce_halfa/data/model/notification_model.dart';
import 'package:get/get.dart';

//Before of 70
abstract class ViewNotificationController extends GetxController {
  getData();
  initVlues();
}

class ViewNotificationControllerImp extends ViewNotificationController {
  MyServices myServices = Get.find();
  String? userId;
  StautusRequest statusRequest = StautusRequest.none;
  ViewNotficationData notficationData = ViewNotficationData(Get.find());
  List<NotificationModel>? notificationList = [];

  @override
  getData() async {
    // print removed
    statusRequest = StautusRequest.loading;
    update();
    var response = await notficationData.getData( userId!);
    statusRequest = handlingStatusRequest(response);
    // print removed
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        notificationList =
            (response['data'] as List)
                //.fromJson will convert the map to object model.
                .map((notification) => NotificationModel.fromJson(notification))
                .toList();
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }


  @override
  void onInit() {
    initVlues();
    getData();
    super.onInit();
  }

  @override
  initVlues() {
 
    userId = myServices.sharedPreferences.getString("user_id");
  }
  


}
