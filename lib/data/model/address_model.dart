class AddressModel {
  int? addressId;
  int? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLang;

  AddressModel({
    this.addressId,
    this.addressUserId,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLang,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    // تأكد من تحويل int إلى double
    //converts any number (int or double) into double.
    //the data is came from the jeolocator so i don't know wihter it will came in form of
    //of int or double so i will just convert it to double عشاننريح دماغنا .
    addressLat =
        json['address_lat'] != null
            ? (json['address_lat'] as num).toDouble()
            : null;
    addressLang =
        json['address_lang'] != null
            ? (json['address_lang'] as num).toDouble()
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_user_id'] = addressUserId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_lang'] = addressLang;
    return data;
  }
}
