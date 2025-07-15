import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:flutter/material.dart';

class HomeWithBottomNav extends StatelessWidget {
  const HomeWithBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_cart_checkout_outlined, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 25,
        child: Row(
          children: [
            Row(
              spacing: 30,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.home_outlined), Text("Home")],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person_outline_outlined),
                      Text("Profile"),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              spacing: 30,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.favorite_outline_outlined),
                      Text("Favorite"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.settings_outlined), Text("Settings")],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: DonAppBar(
        title: 'Don Shop',
        onNotificationIconButtonClicked: () {},
        onChangeWhenSearh: (String text) {},
      ),
    );
  }
}
