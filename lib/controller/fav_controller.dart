import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/favData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//after 86
class FavController extends GetxController {
  FavData favData = FavData(Get.find());
  MyServices myServices = Get.find();
  StautusRequest statusRequest = StautusRequest.none;
  // هنا بنسوي
  //Map
  // اسمها
  // isFav.
  // الهدف منها إننا نتابع حالة الـ
  //Favorite
  //لكل منتج بشكل لحظي في الـ
  //UI.

  // Key
  // الـ
  //Map
  // دا حيكون الـ
  //ID
  // بتاع المنتج الحقيقي اللي جاي من قاعدة البيانات.
  // والـ
  //Value
  // حيكون 0 لو المنتج مش مفضل، و 1
  // لو مفضل.

  // بنستخدمها عشان نقدر نغير حالة الأيقونة بتاعت الـ
  //Favorite
  // بسرعة وفعالية في الـ
  // UI،
  // بدون ما نحتاج نحدث كل البيانات من قاعدة البيانات تاني.
  Map isFav = {};

  // وظيفة الدالة دي إنها تغير حالة الـ
  //Favorite للمنتج.
  // لما المستخدم يضغط على أيقونة الـ
  //Favorite،
  //بنمرر ليها الـ
  //ID بتاع المنتج والقيمة الجديدة
  //(0 أو 1).
  // الـ id هنا هو الـ productsId الحقيقي للمنتج.
  // والـ val هي القيمة الجديدة لـ Favorite (0 أو 1).
  setFav(id, val) {
    // هنا بنحدث قيمة المنتج في الـ isFav Map.
    isFav[id] = val;
    // بنعمل update() عشان نقول لـ GetX إن في تغيير حصل في الـ controller دا،
    // وبالتالي أي GetBuilder بيعتمد على الـ FavController دا هيعمل rebuild للجزء بتاعه.
    update();
  }

  addFav(String productId) async {
    statusRequest = StautusRequest.loading;
    update();
    var response = await favData.addToFav(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);
    print("you'r status request is : $statusRequest");
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          title: "إشعار",
          messageText: Text("تم إضافة المنتج إلي المفضلة"),
        );
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
  }

  deleteFav(String productId) async {
    statusRequest = StautusRequest.loading;
    update();
    var response = await favData.deleteFromFav(
      myServices.sharedPreferences.getString("user_id"),
      productId,
    );
    statusRequest = handlingStatusRequest(response);
    print("you'r status request is : $statusRequest");
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          title: "إشعار",
          messageText: Text("تم حذف المنتج من المفضلة"),
        );
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
  }
}



  // ليه عملنا الـ 
  // Map
  // دي بالذات؟ السبب الرئيسي هو:
  // **سرعة الاستجابة في الـ UI:**
  // لما المستخدم بيضغط على زر الـ 
  //Favorite،
  // هو بيتوقع يشوف التغيير **فورا**.
  // لو كنا هنعتمد على إرسال طلب للباك إند ونستنى الرد يرجع (اللي ممكن ياخد وقت بسبب الشبكة أو معالجة السيرفر)،
  // وبعدين نحدث الـ 
  //UI
  // بناءً على الرد دا، هتكون تجربة المستخدم بطيئة ومتقطعة.
  // الـ 
  //`isFav` Map 
  //بتخليك تغير حالة الأيقونة **مباشرة في الذاكرة 
  //(Local State Management)**،
  // فالمستخدم بيشوف التغيير لحظياً بدون انتظار أي رد من السيرفر.