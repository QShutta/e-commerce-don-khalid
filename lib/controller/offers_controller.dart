import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/offers_data.dart';
import 'package:e_commerce_halfa/data/model/offers_model.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  MyServices myServices = Get.find();
  StautusRequest statusRequest = StautusRequest.none;
  //Why did you din't create a seprate model for the offers?
  //Because of we already have the productsModel and it contains all of the neccery objects that we need.
  List<OfferModel> productList = [];
  OffersData offersData = OffersData(Get.find());

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      productList.clear();
      statusRequest = StautusRequest.loading;
      update();
      var response = await offersData.getData();
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          productList.addAll(
            (response['data'] as List)
                .map((product) => OfferModel.fromJson(product))
                .toList(),
          );
        } else {
          statusRequest = StautusRequest.failure;
        }
      }
      update(); //This will update the UI
    } catch (e) {
      // ignore: avoid_print
      print('Error in OfferController getData: $e');
      update();
    }
  }
}
