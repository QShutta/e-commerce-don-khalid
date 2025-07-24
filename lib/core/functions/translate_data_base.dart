import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

translateDataBase(columnEn, columnAr) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
