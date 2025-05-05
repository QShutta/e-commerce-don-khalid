import 'package:flutter/widgets.dart';
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
  // PageController is used to control and manage the PageView widget.
  // It allows us to programmatically move between pages using methods like 'animateToPage'.
  // We initialize it in onInit to make sure it's ready when the widget starts.
  late PageController pageController;

  @override
  next() {
    currentPage++;
    // This line increments the current page index by 1.
    // It means the user is moving to the next page in the onboarding process.
    // For example, if the current page is 0, it will become 1.
    // If the current page is 1, it will become 2, and so on.
    // This is useful for keeping track of which page the user is on in the onboarding flow.
    // It helps us know when to show the next page or perform any actions related to the current page.
    if (currentPage >= 3) {
      currentPage =
          0; // Reset to the first page if it exceeds the number of pages
      // This line checks if the current page index is greater than or equal to 3.
      // If it is, it resets the current page index back to 0.
      // This is useful for looping through the onboarding pages.
      // For example, if there are 3 pages (0, 1, 2), and the user tries to go to page 3,
      // we reset it to page 0, so they can start over from the beginning.
    }
    pageController.animateToPage(
      currentPage, // Navigate to the next page
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    // This method is used to move to the next page in the PageView.
  }

  @override
  void onInit() {
    pageController = PageController(); // Initialize the controller here
    super.onInit();
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
