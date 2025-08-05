import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(
        title: 'Favorites',
        onNotificationIconButtonClicked: () {},
        onChangeWhenSearh: (String) {},
        showNotificationAndFavorite: false,
        showSearch: false,
      ),
      body: ListView(children: [Center(child: Text("Favorite Page"))]),
    );
  }
}
