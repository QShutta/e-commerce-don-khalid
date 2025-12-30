import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// MyServices is a GetxService, which means it will be created once
// and kept alive as long as the app is running.
// We use it to initialize SharedPreferences once and access it anywhere in the app.
class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  // This method initializes SharedPreferences only once
  Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

// This function is called before the app starts.
// It makes sure the MyServices class is created and ready to use.
// We use Get.putAsync because init() is an async function.
Future initlizeServices() async {
  await Get.putAsync<MyServices>(() async => await MyServices().init());
}
