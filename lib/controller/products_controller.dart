import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/products_data.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

//Before of 70
abstract class ProductsController extends GetxController {
  getData();
  changeSelectedCat(int val);
  initVlues();
}

class ProductsControllerImp extends ProductsController {
  List<Catogeries>? catogeriesList;
  int? selectedCat;

  ProductsData productsData = ProductsData(Get.find());
  StautusRequest? statusRequest;
  List<ProductsModel> products = [];
  @override
  getData() async {
    try {
      print("The getData method has been called?");
      statusRequest = StautusRequest.loading;
      update();
      var response = await productsData.getData();
      statusRequest = handlingStatusRequest(response);
      print(" ");
      print(
        "After handlingstatusRequest method  and the stautsrequest is $statusRequest",
      );
      if (statusRequest == StautusRequest.success) {
        print("After statusRequest == StautusRequest.success method");
        if (response["status"] == "success") {
          print("After respone[status] method");
          products =
              //Why did we say "as List"
              //عشان نقدر نتعامل نتسخدم كلمة
              //map so we can itreate in every element in the list.
              (response['data'] as List)
                  //.fromJson will convert the map to object model.
                  .map((product) => ProductsModel.fromJson(product))
                  .toList();
          print("-------------------------------------");
          print("The Products: ${products.length}");
          print("-------------------------------------");
        } else {
          statusRequest = StautusRequest.failure;
        }
      }
      update(); //This will update the UI
    } catch (e) {
      print('Error in HomeControllerImp.getData: $e');
    }
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
