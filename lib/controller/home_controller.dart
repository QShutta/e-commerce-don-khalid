import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/home_data.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  goToProfile();
  goToSettings();
  logOut();
  getData();
  // This function is used to get the data from the server.
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StautusRequest statusRequest = StautusRequest.none;
  HomeData homeData = HomeData(Get.find());
  String? userName;
  List<Catogeries> categories = [];
  // List products = [];
  List<Products> products = [];
  initalData() {
    userName = myServices.sharedPreferences.getString("google_name");
    userName ??= "Guest";
    update();
  }

  @override
  void onInit() {
    getData();
    initalData();
    super.onInit();
  }

  @override
  goToProfile() {
    // Get.toNamed(AppRoutes.profile);
  }

  @override
  goToSettings() {
    // Get.toNamed(AppRoutes.settings);
  }

  @override
  logOut() async {
    await myServices.sharedPreferences.setBool("isLoggedIn", false);
    Get.offAllNamed(AppRoutes.signIn);
  }

  @override
  getData() async {
    //The inital value for the statusRequest is loading.
    //So the value of the statusRequest before the request is made is loading.
    //And when finish getting the data, we will change the value of the statusRequest to success or failure.
    statusRequest = StautusRequest.loading;
    update();
    //We have to be careful that the getData function that we means here is the getData
    //that exist in the data folder that contain TestData class.
    //And the getData function that we means here is the getData function that exist in the TestData class.
    var response = await homeData.getData();
    //After getting the data we have to change the value of the statusRequest
    //So we have method called handleStatusRequest that will handle the statusRequest
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        // categories.addAll(response['catogeries']);
        // هنا بنحول البيانات الجاية من السيرفر
        //(اللي هي عبارة عن List of Map)
        // إلى
        //List of Catogeries objects باستخدام fromJson
        // الخطوات:
        // 1. نأكد إنو
        //response['catogeries']
        //هي فعلاً
        //List
        //باستخدام
        //(as List)
        // 2. نستخدم
        //.map
        //عشان نلف على كل عنصر
        //(اللي هو Map)
        //ونسميهو
        //catogery
        // 3. نمررو على
        //Catogeries.fromJson
        //عشان نحولو من
        //Map
        //إلى كائن حقيقي من نوع
        //Catogeries
        // 4. بعد التحويل نرجع النتيجة على شكل
        //List
        //باستخدام .toList()
        categories =
            //✅ as List
            // نقول لـ
            //Dart:
            // "يا زول اعتبرها List عادية" عشان نقدر نلف عليها.
            (response['catogeries'] as List)
                // طيب شنو هو .fromJson()؟
                // هي دالة جوّا الـ
                //Model Class،
                // مهمتها تاخد
                //Map
                // وتحوّلو إلى كائن
                //(Object) مرتب.
                .map((catogery) => Catogeries.fromJson(catogery))
                .toList();
        print("-------------------------------------");
        print("Categories: $categories");
        print("-------------------------------------");
        // products.addAll(response['products']);
        products =
            //Why did we say "as List"
            //عشان نقدر نتعامل نتسخدم كلمة
            //map so we can itreate in every element in the list.
            (response['products'] as List)
                //.fromJson will convert the map to object model.
                .map((product) => Products.fromJson(product))
                .toList();
        print("-------------------------------------");
        print("Products: $products");
        print("-------------------------------------");
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }
}
