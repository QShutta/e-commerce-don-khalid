import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:flutter/material.dart';

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
        : stautusRequest == StautusRequest.offlineFailure
        ? Center(child: Text("Offline Failure"))
        : stautusRequest == StautusRequest.failure
        ? Center(child: Text("No Data"))
        : stautusRequest == StautusRequest.serverFailure
        ? Center(child: Text("Server Failure"))
        : widget;
  }
}
