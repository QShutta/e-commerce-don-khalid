import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  onInit() {
    // دالة تنفذ عند تهيئة الكلاس
    getData(); // نجيب البيانات من السيرفر
    super.onInit(); // ننادي الدالة الأساسية من الكلاس الأب
  }

  // كلاس مسؤول عن التحكم في بيانات الشاشة
  TestData testData = TestData(
    Get.find(),
  ); // جايب بيانات عن طريق خدمة جاهزة (dependency injection)
  late StautusRequest
  statusRequest; // متغير يخزن حالة العملية (هل جاري تحميل، نجح أو فشل)
  List data = []; // قائمة لتخزين البيانات اللي جايه من السيرفر
  getData() async {
    // دالة تجيب البيانات من السيرفر بشكل غير متزامن
    statusRequest = StautusRequest.loading; // نعلن إنو جاري تحميل البيانات
    update(); // نحدث واجهة المستخدم عشان تظهر حالة التحميل
    var response = await testData.getData(); // ننتظر الرد من السيرفر (البيانات)
    statusRequest = handlingStatusRequest(
      response,
    ); // نفحص حالة الرد هل نجاح أو فشل
    update();
    if (statusRequest == StautusRequest.success) {
      // لو الرد نجح
      data.addAll(response['data']); // نضيف البيانات اللي جت في قائمة البيانات
      print("-----------------------------------------------");
      print("my data is :${data}");
      print("-----------------------------------------------");
    }
  }
}
