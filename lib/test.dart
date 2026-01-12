import 'package:e_commerce_halfa/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});
  final myCont = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  myCont.increaseCounter();
                },
                icon: Icon(Icons.add),
              ),
              GetBuilder<TestController>(
                builder: (myCont) {
                  return Text(myCont.counter.toString());
                },
              ),
              IconButton(
                onPressed: () {
                  myCont.reduceCounter();
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
