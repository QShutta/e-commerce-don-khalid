import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWithBottomNav extends StatelessWidget {
  HomeWithBottomNav({super.key});
  final HomeWithBottomNavBarController homeWithBottomNavBarController = Get.put(
    HomeWithBottomNavBarController(),
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeWithBottomNavBarController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(Icons.add_shopping_cart_outlined, color: Colors.black),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 30,
            child: Row(
              children: [
                //Why did he use row inside another row?
                Row(
                  spacing: 20.0,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
                        // أو ياخد مساحة على قد المحتوى فقط (min)
                        mainAxisSize: MainAxisSize.min,
                        children: [Icon(Icons.home_outlined), Text("Home")],
                      ),
                    ),

                    InkWell(
                      onTap: () {},
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
                      onTap: () {},
                      child: Column(
                        // mainAxisSize: تحدد إذا كان الـ Column أو Row ياخد كل المساحة المتاحة (max)
                        // أو ياخد مساحة على قد المحتوى فقط (min)
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.settings_outlined),
                          Text("Settings"),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: () {},
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
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Home Page")],
          ),
        );
      },
    );
  }
}
