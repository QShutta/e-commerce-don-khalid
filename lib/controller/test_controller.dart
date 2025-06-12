import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  //حنعمل متغير من نوعList
  //عشان نخن البيناات جوهاهو.

  List data = [];

  late StautusRequest statusRequest;
  getData() async {
    //The inital value for the statusRequest is loading.
    //So the value of the statusRequest before the request is made is loading.
    //And when finish getting the data, we will change the value of the statusRequest to success or failure.
    statusRequest = StautusRequest.loading;
    update();
    //We have to be careful that the getData function that we means here is the getData
    //that exist in the data folder that contain TestData class.
    //And the getData function that we means here is the getData function that exist in the TestData class.
    var response = await testData.getData();
    //After getting the data we have to change the value of the statusRequest
    //So we have method called handleStatusRequest that will handle the statusRequest
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
