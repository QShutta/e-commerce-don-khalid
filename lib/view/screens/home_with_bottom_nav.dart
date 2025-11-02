import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/search_page.dart';
import 'package:e_commerce_halfa/view/widgets/home_with_bottom_nav_bar_widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        return PopScope(
          //"لا تغلق هذه الشاشة تلقائيًا عند الضغط على زر الرجوع
          //(Back Button).
          // أنا سأقرر بنفسي متى وكيف يتم الإغلاق."
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            //!didPop  this condition means that
            //هل نظام التشغيل  طلع من التطبيق ولا لسة ؟لو لسة ما طلع حنعرض ليهو
            //dialogbox
            //and ask him if he is sure that he want to getout from the app
            //يعني هي بتتاكد ليك اسمع الزول دة طلع من التطبيق ولا لسة لو  لسة ما طلع اسالو لينا انتتة اي زول متاكد عاوز
            //تطلع برة ؟
            if (!didPop) {
              Get.defaultDialog(
                //this is to discard from the default title of the dialog.
                title: "",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.redAccent,
                          size: 28,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Exit App",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Are you sure you want to exit?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                            SystemNavigator.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
          child: Scaffold(
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
              onDiscountIconButtonClicked: () {
                Get.toNamed(AppRoutes.offersPageLink);
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
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomAppBar(),

            body: homeWithBottomNavBarController.pages.elementAt(
              homeWithBottomNavBarController.selectedItem,
            ),
          ),
        );
      },
    );
  }
}
