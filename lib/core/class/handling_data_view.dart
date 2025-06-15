import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HnadlingDataView extends StatelessWidget {
  const HnadlingDataView({
    super.key,
    required this.stautusRequest,
    required this.widget,
  });
  final StautusRequest stautusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return stautusRequest == StautusRequest.loading
        ? Center(child: CircularProgressIndicator())
        // ? Center(
        //   child: // Load a Lottie file from your assets
        //       Lottie.asset(ImageAssets.loading),
        // )
        : stautusRequest == StautusRequest.offlineFailure
        ? Center(child: Text("Offline Failure"))
        : stautusRequest == StautusRequest.failure
        ? Center(child: Text("No Data"))
        : stautusRequest == StautusRequest.serverFailure
        ? Center(child: Text("Server Failure"))
        : widget;
  }
}
