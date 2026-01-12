import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class HomeTest extends StatelessWidget {
  HomeTest({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<HomeControllerImp>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("MYTest"),
          GetBuilder<HomeControllerImp>(
            builder: (innerCont) {
              return HnadlingDataView(
                stautusRequest: innerCont.statusRequest,
                widget: ListView.builder(
                  itemCount: innerCont.textList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var product = innerCont.textList[index];
                    return Text(product.settingsTitle.toString());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
