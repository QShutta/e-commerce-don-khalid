import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ProductsController extends GetxController {
  getData();
  changeSelectedCat(int val);
  initVlues();
}

class ProductsControllerImp extends ProductsController {
  List<Catogeries>? catogeriesList;
  int? selectedCat;
  @override
  getData() {}
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
