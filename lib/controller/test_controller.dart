import 'package:get/get.dart';

class TestController extends GetxController {
  int counter = 0;

  increaseCounter() {
    counter++;
    update();
  }

  reduceCounter() {
    counter--;
    update();
  }
}
