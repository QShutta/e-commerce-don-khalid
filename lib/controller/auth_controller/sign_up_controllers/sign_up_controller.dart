import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ✅ استخدمنا abstract class علشان نحدد شكل الدوال اللي لازم تتنفذ في الكلاس الأساسي
// ✅ ده بيساعدنا نفصل بين تعريف الوظائف (interface) وبين التطبيق الفعلي (implementation)
// ✅ بنكتب الدوال في abstract class بدون تفاصيل، وبعدين ننفذها داخل الكلاس اللي بيورث منها
// ✅ الطريقة دي بتنظم الكود أكثر، وبتسهل التوسعة أو التعديل في المشاريع الكبيرة
// ✅ كمان بتفيد في كتابة اختبارات (Testing) أو في حالة حبينا نغير الكود لاحقًا بدون ما نأثر على الباقي

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  goToVerfyCode();
}

class SignUpControllerImp extends SignUpController {
  // ✅ عرفنا المتغيرات باستخدام
  //`late`
  // لأننا حنهيئهم في
  // onInit()
  late FocusNode passwordFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode nameFocusNode;
  late FocusNode confirmPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailCont;
  late TextEditingController passwordCont;
  late TextEditingController nameCont;
  late TextEditingController confirmPasswordCont;

  @override
  void onInit() {
    // ✅ تهيئة المتغيرات هنا عشان تكون جاهزة أول ما يتم إنشاء الكلاس
    emailCont = TextEditingController();
    passwordCont = TextEditingController();
    nameCont = TextEditingController();
    confirmPasswordCont = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    confirmPassword = FocusNode();

    super.onInit();
  }

  @override
  signUp() {
    if (formKey.currentState!.validate()) {
      if (passwordCont.text != confirmPasswordCont.text) {
        Get.snackbar(
          "58".tr,
          "59".tr,
          snackPosition: SnackPosition.BOTTOM, // تظهر في أسفل الشاشة
          backgroundColor: Colors.red, // خلفية حمراء شفافة شوي
          colorText: Colors.white, // نص أبيض واضح
          margin: const EdgeInsets.all(10), // مسافة من حدود الشاشة
          borderRadius: 8, // زوايا دائرية للنافذة
          duration: const Duration(seconds: 3), // تظهر 3 ثواني ثم تختفي
        );

        return;
      } else {
        goToVerfyCode();
      }
    } else {
      print("not valide");
    }
  }

  @override
  goToSignIn() {
    // TODO: implement navigation to SignIn screen
  }

  @override
  goToVerfyCode() {
    Get.offAllNamed(AppRoutes.signUpOtp, arguments: {"email": emailCont.text});
  }

  @override
  void dispose() {
    // Dispose of the controllers and focus nodes to free up resources

    // ✅ بنستخدم
    //dispose
    // علشان نتخلص من الموارد اللي مش بنحتاجها بعد كده
    // 🎯 مثال: تخيل إن عندك مروحة شغالة بالكهرباء (زي
    // TextEditingController)
    //لو خلصت منها وما فصلت الكهرباء
    //(يعني ما عملت dispose)،
    // المروحة حتفضل شغالة وتستهلك كهرباء على الفاضي!
    //  نفس الشيء هنا، لازم نقول للـ Controller و FocusNode إننا ما عدنا محتاجينهم

    // 🧹 نبدأ نحرر الموارد (Controllers)

    emailCont.dispose();
    passwordCont.dispose();
    nameCont.dispose();
    confirmPasswordCont.dispose();
    // Dispose of the focus nodes
    // This is important to prevent memory leaks
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
    confirmPassword.dispose();

    super.dispose();
  }
}
