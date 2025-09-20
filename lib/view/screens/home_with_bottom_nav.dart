import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/search_page.dart';
import 'package:e_commerce_halfa/view/widgets/home_with_bottom_nav_bar_widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWithBottomNav extends StatelessWidget {
  HomeWithBottomNav({super.key});
  final HomeWithBottomNavBarControllerImp homeWithBottomNavBarController =
      Get.put(HomeWithBottomNavBarControllerImp());
  //before of 67
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeWithBottomNavBarControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: DonAppBar(
            title: "Don Shop",
            //This is the color of the title in the appBar.
            textColor: Colors.white,

            //There are tow search icon:
            //1-The first one her job is just to take you to the search page.
            //2-The secound search icon will implement the real search job.
            onFirstSearchButtonClicked: () {
              Get.to(() => SearchPage());
            },
            onNotificationIconButtonClicked: () {},
            onFavoriteButtonPressed: () {
              homeWithBottomNavBarController.goToFavoritePage();
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
            child: Icon(Icons.add_shopping_cart_outlined, color: Colors.black),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppBar(),

          body: homeWithBottomNavBarController.pages.elementAt(
            homeWithBottomNavBarController.selectedItem,
          ),
        );
      },
    );
  }
}
