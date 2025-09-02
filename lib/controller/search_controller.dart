import 'package:e_commerce_halfa/view/widgets/home_widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearchCont extends GetxController {
  TextEditingController? searchController;
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  checkSearch(String value) {
    if (value.isEmpty || value == "") {
      print("the user wirte this shit:$value");
      Get.back();
    }
  }

  onFinalSearchButttonClicked() {
    print("-------------------------------------------------------");
    print("the final search button is clicked ");
  }
}
