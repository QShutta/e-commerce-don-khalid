import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// ✅ استخدمنا abstract class علشان نحدد شكل الدوال اللي لازم تتنفذ في الكلاس الأساسي
// ✅ ده بيساعدنا نفصل بين تعريف الوظائف (interface) وبين التطبيق الفعلي (implementation)
// ✅ بنكتب الدوال في abstract class بدون تفاصيل، وبعدين ننفذها داخل الكلاس اللي بيورث منها
// ✅ الطريقة دي بتنظم الكود أكثر، وبتسهل التوسعة أو التعديل في المشاريع الكبيرة
// ✅ كمان بتفيد في كتابة اختبارات (Testing) أو في حالة حبينا نغير الكود لاحقًا بدون ما نأثر على الباقي

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  goToVerifyCode();
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
    // TODO: implement signUp logic
  }

  @override
  goToSignIn() {
    // TODO: implement navigation to SignIn screen
  }

  @override
  goToVerifyCode() {
    // TODO: implement navigation to Verify Code screen
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
