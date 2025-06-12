import 'package:e_commerce_halfa/controller/test_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//before of 39
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    TestController testController = Get.put(TestController());

    return Scaffold(
      body: GetBuilder<TestController>(
        builder: (testController) {
          return HnadlingDataView(
            stautusRequest: testController.statusRequest,
            widget: ListView.builder(
              itemCount: testController.data.length,
              itemBuilder: (context, index) {
                return Text("${testController.data[index]["user_name"]}");
              },
            ),
          );
        },
      ),
    );
  }
}
