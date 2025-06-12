import 'package:e_commerce_halfa/controller/test_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    TestController testController = Get.put(TestController());

    return Scaffold(
      body: GetBuilder<TestController>(
        builder: (controller) {
          if (testController.statusRequest == StautusRequest.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (testController.statusRequest ==
              StautusRequest.offlineFailure) {
            return Center(child: Text("Offline Failure"));
          } else if (testController.statusRequest ==
              StautusRequest.serverFailure) {
            return Center(child: Text("Server Failure"));
          } else {
            return ListView.builder(
              itemCount: testController.data.length,
              itemBuilder: (context, index) {
                return Text("${testController.data[index]["user_name"]}");
              },
            );
          }
        },
      ),
    );
  }
}
