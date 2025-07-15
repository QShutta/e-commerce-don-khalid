import 'package:e_commerce_halfa/controller/test_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//before of 39S
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List myPages = [HomeTest(), SettingTest(), FavTest(), ProfileTest()];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Test Page")),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(color: Colors.red),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          currentIndex: selectedItem,
          onTap: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
          ],
        ),
        body: myPages.elementAt(selectedItem),
      ),
    );
  }
}

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text("Home Page out")],
    );
  }
}

class SettingTest extends StatelessWidget {
  const SettingTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text("Setting Page")],
    );
  }
}

class ProfileTest extends StatelessWidget {
  const ProfileTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text("Profile Page")],
    );
  }
}

class FavTest extends StatelessWidget {
  const FavTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text("Favorite Page")],
    );
  }
}
