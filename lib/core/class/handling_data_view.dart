import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// 📌 ملاحظة توضيحية:
///
/// ✅ `HandlingDataView`:
/// - نستخدمه لما نعرض بيانات من السيرفر.
/// - يتعامل مع كل الحالات:
///   - التحميل `loading`
///   - لا يوجد اتصال `offlineFailure`
///   - فشل في السيرفر `serverFailure`
///   - البيانات فاضية أو فشل منطقي `failure`
///
/// ✅ `HandlingDataRequest`:
/// - نستخدمه لما ننفذ طلب بدون عرض بيانات (زي تسجيل الدخول أو حذف حساب).
/// - يتعامل فقط مع:
///   - التحميل `loading`
///   - لا يوجد اتصال `offlineFailure`
///   - فشل في السيرفر `serverFailure`
/// - ما بيعرض حالة `failure` الخاصة بغياب البيانات.
///
/// ✅ القاعدة الذهبية:
/// - لو الصفحة **بتعرض بيانات** → استخدم `HandlingDataView`
/// - لو الصفحة **فيها تنفيذ فقط بدون عرض بيانات** → استخدم `HandlingDataRequest`

class HnadlingDataView extends StatelessWidget {
  HnadlingDataView({
    super.key,
    required this.stautusRequest,
    required this.widget,
    this.optionalLoadingWidget,
  });
  final StautusRequest stautusRequest;
  final Widget widget;
  Widget? optionalLoadingWidget;
  @override
  Widget build(BuildContext context) {
    return stautusRequest == StautusRequest.loading
        // ? Center(child: CircularProgressIndicator())
        ? optionalLoadingWidget == null
            ? LoadingWidget()
            : optionalLoadingWidget!
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

// 📌 Shows loading covering the entire screen
class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest({
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
        ? LoadingWidget()
        : stautusRequest == StautusRequest.offlineFailure
        // ? Center(child: Text("Offline Failure"))
        ? Center(
          child: // Load a Lottie file from your assets
              Lottie.asset(ImageAssets.offline, width: 350, height: 350),
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

// 📌 Shows loading as an overlay so the screen is still visible behind it
class HandlingDataRequestOverlay extends StatelessWidget {
  const HandlingDataRequestOverlay({
    super.key,
    required this.stautusRequest,
    required this.widget,
  });

  final StautusRequest stautusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget, // Main screen content
        if (stautusRequest == StautusRequest.loading)
          const Center(child: LoadingWidget()),
        if (stautusRequest == StautusRequest.offlineFailure)
          Center(
            child: Lottie.asset(ImageAssets.offline, width: 350, height: 350),
          ),
        if (stautusRequest == StautusRequest.serverFailure)
          Center(
            child: Lottie.asset(
              ImageAssets.serverFailure,
              width: 350,
              height: 350,
            ),
          ),
      ],
    );
  }
}
