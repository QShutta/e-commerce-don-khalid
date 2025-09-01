import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/search_widget.dart';
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
            textColor: Colors.black,
            onNotificationIconButtonClicked: () {},
            //What is the benfit of the onchange:The course instructor want to do what ?
            //He want once the user remove all of the text in the textformfield the content of the home page will
            //return back.
            //I have to search icon:
            //1-the first icon in the home page  when click on it you will be taked to the search page
            //2-The secound search icon is in the search page when the user write something and search for it .
            onFirstSearchButtonClicked: () {
              Get.to(
                () => SearchPage(
                  onFinalSearchButtonClicked: () {},
                  onChangeWhenSearh: (val) {
                    print("the user write $val");
                    homeWithBottomNavBarController.checkSearch(val);
                  },
                  searchController:
                      homeWithBottomNavBarController.searchController,
                ),
              );
              homeWithBottomNavBarController.onFinalSearchButtonClicked();
            },
            onChangeWhenSearh: (String value) {
              controller.checkSearch(value);
            },
            onFavoriteButtonPressed: () {
              homeWithBottomNavBarController.goToFavoritePage();
            },
            searchController: homeWithBottomNavBarController.searchController,
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
