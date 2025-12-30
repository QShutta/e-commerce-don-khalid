import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

// class ModelTest extends StatelessWidget {
//   ModelTest({super.key});
//   final Flutter3DController controller = Flutter3DController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("3D Model", style: TextStyle(fontFamily: 'cairo')),
//       ),
//       body: Flutter3DViewer(
//         src: 'assets/images/model/Astronaut.glb',
//         onLoad: (load) {
//           controller.onModelLoaded.addListener(() {});
//         },
//       ),
//     );
//   }
// }

class RecommandationTest extends StatefulWidget {
  const RecommandationTest({super.key});

  @override
  State<RecommandationTest> createState() => _RecommandationTestState();
}

class _RecommandationTestState extends State<RecommandationTest> {
  List recommandation = [];
  bool isLoading = true;
  Future getRecommendation() async {
    isLoading = true;
    setState(() {});
    Uri url = Uri.http("localhost:8080", "/test2.php");
    Response response = await post(url);
    isLoading = false;
    setState(() {});
    Map res = jsonDecode(response.body);
    List recommand = res['recommendations'];
    recommandation.addAll(recommand);
  }

  Future selectAllProductsRecommandation() async {
    getRecommendation();
    List productIds = recommandation;
    Uri url = Uri.http("localhost:8080", "/");
    Response response = await post(url);
    var data = jsonDecode(response.body);
    List recommends = data['data'];
    return recommends;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "Recommanded for you",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                SizedBox(height: 4),
                Container(
                  height: 200,
                  child: ListView.separated(
                    itemCount: recommandation.length,
                    separatorBuilder: (context, i) => SizedBox(width: 4),
                    itemBuilder: (context, i) {
                      return Column(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(recommandation[i]['image']),
                          Text(recommandation[i]['name']),
                          Text("${recommandation[i]['price']}"),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
