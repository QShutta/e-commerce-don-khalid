import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/products_data.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:get/get.dart';

//Before of 70
abstract class ProductsController extends GetxController {
  getData();
  changeSelectedCat(int val);
  initVlues();
}

class ProductsControllerImp extends ProductsController {
  List<Catogeries>? catogeriesList;
  int? selectedCat;
  StautusRequest statusRequest = StautusRequest.none;
  ProductData productData = ProductData(Get.find());
  List<ProductsModel>? producstsLis = [];
  @override
  getData() async {
    print(
      '--------------------------inside of the getData()--------------------------',
    );
    statusRequest = StautusRequest.loading;
    update();
    var response = await productData.getData();
    statusRequest = handlingStatusRequest(response);
    print("you'r status request is : $statusRequest");
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        producstsLis =
            (response['data'] as List)
                //.fromJson will convert the map to object model.
                .map((product) => ProductsModel.fromJson(product))
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
    catogeriesList = Get.arguments["catogeries"];
    selectedCat = Get.arguments["selecedCatogery"];
  }

  @override
  changeSelectedCat(int val) {
    selectedCat = val;
    update();
  }
}
