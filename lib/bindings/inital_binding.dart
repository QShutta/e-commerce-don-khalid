import 'package:e_commerce_halfa/core/class/crud.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
