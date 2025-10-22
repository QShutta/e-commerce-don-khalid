class OrderModel {
  int? orderId;
  int? orderUserId;
  int? orderPrice;
  int? orderShipingPrice;
  int? orderDeliveryType;
  int? orderPaymentMethod;
  int? orderAddress;
  int? orderCoupon;
  String? orderDateCreate;
  int? orderTotalPrice;
  int? orderStatus;
  int? addressId;
  int? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLang;

  OrderModel({
    this.orderId,
    this.orderUserId,
    this.orderPrice,
    this.orderShipingPrice,
    this.orderDeliveryType,
    this.orderPaymentMethod,
    this.orderAddress,
    this.orderCoupon,
    this.orderDateCreate,
    this.orderTotalPrice,
    this.orderStatus,
    this.addressId,
    this.addressUserId,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLang,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderPrice = json['order_price'];
    orderShipingPrice = json['order_shiping_price'];
    orderDeliveryType = json['order_delivery_type'];
    orderPaymentMethod = json['order_payment_method'];
    orderAddress = json['order_address'];
    orderCoupon = json['order_coupon'];
    orderDateCreate = json['order_date_create'];
    orderTotalPrice = json['order_total_price'];
    orderStatus = json['order_status'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_user_id'] = this.orderUserId;
    data['order_price'] = this.orderPrice;
    data['order_shiping_price'] = this.orderShipingPrice;
    data['order_delivery_type'] = this.orderDeliveryType;
    data['order_payment_method'] = this.orderPaymentMethod;
    data['order_address'] = this.orderAddress;
    data['order_coupon'] = this.orderCoupon;
    data['order_date_create'] = this.orderDateCreate;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_status'] = this.orderStatus;
    data['address_id'] = this.addressId;
    data['address_user_id'] = this.addressUserId;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_lang'] = this.addressLang;
    return data;
  }
}
