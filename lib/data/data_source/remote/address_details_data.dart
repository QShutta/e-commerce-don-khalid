import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class AddressDetailsData {
  Crud crud;
  AddressDetailsData(this.crud);

  Future addAddressDetailsData(
    userId,
    addressName,
    addressCity,
    addressStreet,
    lang,
    long,
  ) async {
    var response = await crud.postData(AppLinkApi.addAddressDetails, {
      "address_user_id": userId,
      "address_name": addressName,
      "address_city": addressCity,
      "address_street": addressStreet,
      "address_lat": lang,
      "address_lang": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  // حذف عنوان
  Future deleteAddressDetailsData(addressId) async {
    var response = await crud.postData(AppLinkApi.deleteAddress, {
      "address_id": addressId, // في الـ PHP الحذف بالـ address_id
    });
    return response.fold((l) => l, (r) => r);
  }

  // تعديل عنوان
  Future updateAddressDetailsData(
    addressId,
    addressName,
    addressCity,
    addressStreet,
    lat,
    long,
  ) async {
    var response = await crud.postData(AppLinkApi.updateAddress, {
      "address_id": addressId, // ما بيتعدل لكن بنحتاجه في الـ where
      "address_name": addressName,
      "address_city": addressCity,
      "address_street": addressStreet,
      "address_lat": lat,
      "address_lang": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  // عرض كل العناوين لمستخدم معيّن
  Future viewAddressDetailsData(userId) async {
    var response = await crud.postData(AppLinkApi.viewAddress, {
      "address_user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
