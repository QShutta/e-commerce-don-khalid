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
        // ? Center(child: CircularProgressIndicator())
        ? Center(
          child: // Load a Lottie file from your assets
              Lottie.asset(ImageAssets.loading, width: 120, height: 120),
        )
        : stautusRequest == StautusRequest.offlineFailure
        // ? Center(child: Text("Offline Failure"))
        ? Center(
          child: // Load a Lottie file from your assets
              Lottie.asset(ImageAssets.offline, width: 350, height: 350),
        )
        : stautusRequest == StautusRequest.failure
        // ? Center(child: Text("No Data"))
        ? Center(
          child: // Load a Lottie file from your assets
              Lottie.asset(ImageAssets.noDataFound, width: 350, height: 350),
        )
        : stautusRequest == StautusRequest.serverFailure
        // ? Center(child: Text("Server Failure"))
        ? Center(
          child: // Load a Lottie file from your assets
              Lottie.asset(ImageAssets.serverFailure, width: 350, height: 350),
        )
        : widget;
  }
}
