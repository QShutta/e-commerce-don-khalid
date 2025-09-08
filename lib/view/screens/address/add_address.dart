import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(title: "Address", textColor: Colors.black),
    );
  }
}
