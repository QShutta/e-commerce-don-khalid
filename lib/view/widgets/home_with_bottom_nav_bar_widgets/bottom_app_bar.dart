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
      notchMargin: 20.0,
      child: Row(
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
          ...List.generate(homeWithBottomNavBarController.pages.length + 1, (
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

            int i = index > 2 ? index - 1 : index;
            //قلنا ليهو انتة لو وصلتة العنصر رقم 2 ختي لينا شنو ?
            //spacer
            //اي مساحة فاضية عشان نقدر نخت فيها ال
            //floationactionbutton
            return index == 2
                ? Spacer()
                : Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
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
          //Why did he use row inside another row?
          // Row(
          //   spacing: 20.0,
          //   children: [
          //     CustomeButtonBottomNavBar(
          //       onTap: () {
          //         homeWithBottomNavBarController.changeCurrentPage(0);
          //       },
          //       icon: Icons.home_outlined,
          //       title: 'Home',
          //       active: homeWithBottomNavBarController.selectedItem == 0,
          //     ),
          //     CustomeButtonBottomNavBar(
          //       onTap: () {
          //         homeWithBottomNavBarController.changeCurrentPage(1);
          //       },
          //       icon: Icons.person_outline,
          //       title: 'Profile',
          //       active: homeWithBottomNavBarController.selectedItem == 1,
          //     ),
          //   ],
          // ),
          // Spacer() يضيف فراغ مرن بين المجموعتين، ويدفع كل مجموعة لأطراف الشاشة
          // Spacer(),
          // Row(
          //   spacing: 20.0,
          //   children: [
          //     CustomeButtonBottomNavBar(
          //       onTap: () {
          //         homeWithBottomNavBarController.changeCurrentPage(2);
          //       },
          //       icon: Icons.favorite_border_outlined,
          //       title: 'Favorite',
          //       active: homeWithBottomNavBarController.selectedItem == 2,
          //     ),
          //     CustomeButtonBottomNavBar(
          //       onTap: () {
          //         homeWithBottomNavBarController.changeCurrentPage(3);
          //       },
          //       icon: Icons.settings_outlined,
          //       title: 'Settings',
          //       active: homeWithBottomNavBarController.selectedItem == 3,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
