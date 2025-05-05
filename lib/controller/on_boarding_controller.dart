import 'package:get/get.dart';
// الكلاس الـ
//abstract
// بنستخدمه لتعريف الدوال الأساسية
// الخاصة بصفحات الـ
//onboarding، مثل `nextPage`، `skip`،
// بدون ما نكتب الكود الكامل. الهدف هو تحديد الهيكل العام.
// بعدين، في كلاس تاني بنرث من الكلاس ده ونعمل الكود الخاص
// بكل دالة حسب التطبيق الفعلي. هذا يسهل علينا العمل ويجعل
// التنفيذ أسرع، لأنه بمجرد ما نرث الكلاس الـ
//abstract،
// بنكون عارفين الدوال اللي لازم نكتب لها الكود.

abstract class OnBoardingController extends GetxController {
  next();
  // is called when the user presses the "Next" button
  // to go to the next onboarding page.

  onPageChanged(int index);
  // is called when the user swipes or moves
  // from one onboarding page to another. The 'index' parameter tells
  // which page the user moved to.
  //The pageview builder have a feature that allows you to get the index of the page that is currently visible.
  // This is useful for updating the UI or performing actions based on the current page.
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;

  @override
  next() {
    // TODO: implement next
    throw UnimplementedError();
  }

  @override
  onPageChanged(int index) {
    // ال
    //index
    // ده جاي من الـ
    //PageView
    //لما المستخدم يغير الصفحة
    // يعني لما يسحب يمين أو يسار،
    // PageView
    //بيدي رقم الصفحة الجديدة تلقائياً
    currentPage = index;
    update(); // This method is used to notify the UI that the state has changed.
    // It tells GetX to rebuild any widgets that are listening to this controller.
    // So when the page changes, we call update() to refresh the UI with the new page index.
    // This is important for keeping the UI in sync with the data or state of the application.
  }
}
