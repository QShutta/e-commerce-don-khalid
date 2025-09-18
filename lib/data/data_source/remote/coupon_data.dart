import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class CouponData {
  Crud crud;
  CouponData(this.crud);

  Future getData(String couponName) async {
    var response = await crud.postData(AppLinkApi.getValidCoupon, {
      "coupon_name": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
