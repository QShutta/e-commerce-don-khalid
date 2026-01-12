import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar_controller.dart';
import 'package:e_commerce_halfa/view/widgets/home_with_bottom_nav_bar_widgets/custome_button_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({super.key});
  final HomeWithBottomNavBarControllerImp homeWithBottomNavBarController =
      Get.find();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 30,
      //هذه الخاصية تستخدم لتحديد شكل الحافة العلوية للـ
      //BottomAppBar
      // فائدة: لو عندك
      // FloatingActionButton
      // في منتصف الـ
      //BottomAppBar،
      // هذا الشكل بيعمل فتحة
      //(Notch)
      // عشان الـ
      //FAB
      //يندمج مع التصميم بشكل جميل.
      shape: const CircularNotchedRectangle(),
      //هذا هو مقدار المسافة أو الفراغ بين الـ
      //FloatingActionButton
      // وبين الحافة المقوسة
      // داخل
      // BottomAppBar.
      notchMargin: 15.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // عدد العناصر الأساسية في الـ
          //BottomBar هو 4 Widgets
          // أضفنا عنصر إضافي
          //Spacer()
          // عشان نترك فراغ في النص للـ
          // FloatingActionButton
          // يعني المجموع بقى 5 عناصر، عشان كده استخدمنا: +1
          // الترتيب:
          // [Favorite, Settings] يسار — Spacer — [Home, Profile] يمين
          // والـ
          //FloatingActionButton
          // بيكون في النص بالضبط فوق الـ
          // Spacer
          ...List.generate(homeWithBottomNavBarController.pages.length, (
            index,
          ) {
            // نستخدم هذا الشرط عشان نتجاوز الفراغ
            //(Spacer)
            // الموجود في
            //index 2
            // لأننا أضفنا عنصر زيادة في القائمة باستخدام +1 في
            // List.generate
            // وبالتالي، العناصر اللي بعد الفراغ لازم نطرح منها 1 عشان نرجع للـ
            //index الصحيح
            // مثال:
            // index = 0 أو 1 → نستخدمه كما هو
            // index = 3 → لازم نطرحه 1 عشان نصل للعنصر رقم 2
            // index = 4 → نطرحه 1 عشان نصل للعنصر رقم 3
            int i = index;
            //قلنا ليهو انتة لو وصلتة العنصر رقم 2 ختي لينا شنو ?
            //spacer
            //اي مساحة فاضية عشان نقدر نخت فيها ال
            //floationactionbutton
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: CustomeButtonBottomNavBar(
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(i);
                },
                icon: homeWithBottomNavBarController.iconBottomNavBar[i],
                title: homeWithBottomNavBarController.titleBottomAppBar[i],
                active:
                    homeWithBottomNavBarController.selectedItem == i
                        ? true
                        : false,
              ),
            );
          }),
        ],
      ),
    );
  }
}
