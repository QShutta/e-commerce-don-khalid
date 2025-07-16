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
          //Why did he use row inside another row?
          Row(
            spacing: 20.0,
            children: [
              CustomeButtonBottomNavBar(
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(0);
                },
                icon: Icons.home_outlined,
                title: 'Home',
                active:
                    homeWithBottomNavBarController.selectedItem == 0
                        ? true
                        : false,
              ),

              CustomeButtonBottomNavBar(
                active:
                    homeWithBottomNavBarController.selectedItem == 1
                        ? true
                        : false,
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(1);
                },
                icon: Icons.person_outline,
                title: 'Profile',
              ),
            ],
          ),
          // Spacer() يضيف فراغ مرن بين المجموعتين، ويدفع كل مجموعة لأطراف الشاشة
          Spacer(),
          Row(
            spacing: 20.0,
            children: [
              CustomeButtonBottomNavBar(
                active:
                    homeWithBottomNavBarController.selectedItem == 2
                        ? true
                        : false,
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(2);
                },
                icon: Icons.favorite_outline,
                title: 'Favorite',
              ),

              CustomeButtonBottomNavBar(
                active:
                    homeWithBottomNavBarController.selectedItem == 3
                        ? true
                        : false,
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(3);
                },
                icon: Icons.settings_outlined,
                title: 'Settings',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
