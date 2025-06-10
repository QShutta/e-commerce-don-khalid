import 'package:e_commerce_halfa/core/functions/check_internet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  initlizeVar() async {
    res = await checkInternet();
    print("------------------------------------------------------");
    print("Internet status: $res");
    print("------------------------------------------------------");
  }

  @override
  void initState() {
    super.initState();
    initlizeVar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Page")),
      body: Center(
        child: Text(
          "This is a test page",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
