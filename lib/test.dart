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
    TestController testCont = Get.put(
      TestController(),
    ); // Initialize the controller
    return Scaffold(
      appBar: AppBar(title: const Text('Test Page')),
      body: GetBuilder<TestController>(
        init: TestController(),
        builder: (_) {
          if (testCont.statusRequest == StautusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (testCont.statusRequest == StautusRequest.offlineFailure) {
            return Center(child: Text("Offline failure"));
          } else if (testCont.statusRequest == StautusRequest.serverFailure) {
            return Center(child: Text("Server failure"));
          } else {
            return ListView.builder(
              itemCount: testCont.data.length,
              itemBuilder: (context, index) {
                return Text("${testCont.data[index]['user_name']}");
              },
            );
          }
        },
      ),
    );
  }
}
