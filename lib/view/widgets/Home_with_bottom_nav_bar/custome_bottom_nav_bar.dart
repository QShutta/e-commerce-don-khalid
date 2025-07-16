import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar_controler.dart';
import 'package:e_commerce_halfa/view/widgets/Home_with_bottom_nav_bar/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomeBottomNavBar extends StatelessWidget {
  CustomeBottomNavBar({super.key});
  final HomeWithBottomNavBarControllerImp homeWithBottomNavBarController =
      Get.find();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 30,
      child: Row(
        children: [
          //Why did he use row inside another row?
          Row(
            spacing: 20.0,
            children: [
              CustomeButtonForBottomNavBar(
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(0);
                },
                title: 'Home',
                icon: Icons.home_outlined,
              ),

              CustomeButtonForBottomNavBar(
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(1);
                },
                title: 'Profile',
                icon: Icons.person_outline,
              ),
            ],
          ),
          // Spacer() يضيف فراغ مرن بين المجموعتين، ويدفع كل مجموعة لأطراف الشاشة
          Spacer(),
          Row(
            spacing: 20.0,
            children: [
              CustomeButtonForBottomNavBar(
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(2);
                },
                title: 'Favorite',
                icon: Icons.favorite_outline,
              ),

              CustomeButtonForBottomNavBar(
                onTap: () {
                  homeWithBottomNavBarController.changeCurrentPage(3);
                },
                title: 'Settings',
                icon: Icons.settings_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
