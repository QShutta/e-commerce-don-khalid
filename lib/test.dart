import 'package:e_commerce_halfa/core/functions/check_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  initlization() async {
    res = await checkInternet();
    print("-----------------------------------------------------------");
    print("The internet connection status is: $res");
    print("-----------------------------------------------------------");
  }

  @override
  void initState() {
    super.initState();
    initlization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Test Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
