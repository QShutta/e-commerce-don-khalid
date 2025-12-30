import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/recomendation_data.dart';
import 'package:e_commerce_halfa/data/model/recomendation_model.dart';
import 'package:get/get.dart';

//after of 159
class RecomendationController extends GetxController {
  List<RecomendationModel> productList = [];
  //In case of the user choose to pick up the product from the store i want to display the store location in the map.

  RecomendationData recomendationData = RecomendationData(Get.find());
  late StautusRequest statusRequest;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    getRecommendations();
    super.onInit();
  }

  getRecommendations() async {
    statusRequest = StautusRequest.loading;
    productList.clear();
    update();
    var response = await recomendationData.getData(
      myServices.sharedPreferences.getString("user_id")!,
    );
    statusRequest = handlingStatusRequest(response);
    update();
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        productList.addAll(
          response['recommendations']
              .map<RecomendationModel>(
                (item) => RecomendationModel.fromJson(item),
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
