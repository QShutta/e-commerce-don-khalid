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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_user_id'] = orderUserId;
    data['order_price'] = orderPrice;
    data['order_shiping_price'] = orderShipingPrice;
    data['order_delivery_type'] = orderDeliveryType;
    data['order_payment_method'] = orderPaymentMethod;
    data['order_address'] = orderAddress;
    data['order_coupon'] = orderCoupon;
    data['order_date_create'] = orderDateCreate;
    data['order_total_price'] = orderTotalPrice;
    data['order_status'] = orderStatus;
    return data;
  }
}
