import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
              InkWell(
                onTap: () {
                  homeWithBottomNavBarController.changePage(0);
                },
                child: Column(
                  // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
                  // أو ياخد مساحة على قد المحتوى فقط (min)
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.home_outlined), Text("Home")],
                ),
              ),

              InkWell(
                onTap: () {
                  homeWithBottomNavBarController.changePage(1);
                },
                child: Column(
                  // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
                  // أو ياخد مساحة على قد المحتوى فقط (min)
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.person_outline), Text("Profile")],
                ),
              ),
            ],
          ),
          // Spacer() يضيف فراغ مرن بين المجموعتين، ويدفع كل مجموعة لأطراف الشاشة
          Spacer(),
          Row(
            spacing: 20.0,
            children: [
              InkWell(
                onTap: () {
                  homeWithBottomNavBarController.changePage(2);
                },
                child: Column(
                  // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
                  // أو ياخد مساحة على قد المحتوى فقط (min)
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.settings_outlined), Text("Settings")],
                ),
              ),

              InkWell(
                onTap: () {
                  homeWithBottomNavBarController.changePage(3);
                },
                child: Column(
                  // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
                  // أو ياخد مساحة على قد المحتوى فقط (min)
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border_outlined),
                    Text("Favorite"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
