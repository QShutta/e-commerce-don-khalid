class OrderDetailsModel {
  // Cart/Order Item Details
  int?
  cartItemPrice; // Original productPrice (Line 1) - Price associated with the cart item
  int?
  cartProductQuantity; // Original productCount (Line 2) - Quantity of this item in the cart/order
  int? productPriceAfterDiscopunt;
  int? cartId;
  int? cartUserId;
  int? cartProductId;
  int? cartOrder;

  // Product Details
  int? productsId;
  String? productNameAr;
  String? proudctNameEn;
  String? productDescAr;
  String? productDescEn;
  String? productImage;

  // Renamed Fields to avoid conflict and reflect meaning
  int?
  productStockQuantity; // Represents: المنتج دة متاح منو كم قطعة في المخزن. (Original productCount Line 15)
  int? productActive;
  int?
  productUnitPrice; // Represents: السعر للقطعة الواحدة من المنتج. (Original productPrice Line 17)
  int? productDiscount;
  String? productDataCreate;
  int? productCatogery;

  OrderDetailsModel({
    this.cartItemPrice,
    this.cartProductQuantity,
    this.productPriceAfterDiscopunt,
    this.cartId,
    this.cartUserId,
    this.cartProductId,
    this.cartOrder,
    this.productsId,
    this.productNameAr,
    this.proudctNameEn,
    this.productDescAr,
    this.productDescEn,
    this.productImage,
    this.productStockQuantity,
    this.productActive,
    this.productUnitPrice,
    this.productDiscount,
    this.productDataCreate,
    this.productCatogery,
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    // Mapping for Cart/Order Item Details
    cartItemPrice =
        json['productPrice']; // Note: Retained original JSON key if possible
    cartProductQuantity =
        json['productCount']; // Note: Retained original JSON key if possible
    productPriceAfterDiscopunt = json['productPriceAfterDiscopunt'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartProductId = json['cart_product_id'];
    cartOrder = json['cart_order'];

    // Mapping for Product Details
    productsId = json['products_id'];
    productNameAr = json['product_name_ar'];
    proudctNameEn = json['proudct_name_en'];
    productDescAr = json['product_desc_ar'];
    productDescEn = json['product_desc_en'];
    productImage = json['product_image'];

    // Mapped Renamed Fields
    productStockQuantity =
        json['product_count']; // Assuming 'product_count' is the stock key
    productActive = json['product_active'];
    productUnitPrice =
        json['product_price']; // Assuming 'product_price' is the unit price key
    productDiscount = json['product_discount'];
    productDataCreate = json['product_data_create'];
    productCatogery = json['product_catogery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productPrice'] =
        this.cartItemPrice; // Using old key for cart item price
    data['productCount'] =
        this.cartProductQuantity; // Using old key for cart item count
    data['productPriceAfterDiscopunt'] = this.productPriceAfterDiscopunt;
    data['cart_id'] = this.cartId;
    data['cart_user_id'] = this.cartUserId;
    data['cart_product_id'] = this.cartProductId;
    data['cart_order'] = this.cartOrder;
    data['products_id'] = this.productsId;
    data['product_name_ar'] = this.productNameAr;
    data['proudct_name_en'] = this.proudctNameEn;
    data['product_desc_ar'] = this.productDescAr;
    data['product_desc_en'] = this.productDescEn;
    data['product_image'] = this.productImage;
    data['product_count'] =
        this.productStockQuantity; // Using old key for stock quantity
    data['product_active'] = this.productActive;
    data['product_price'] =
        this.productUnitPrice; // Using old key for unit price
    data['product_discount'] = this.productDiscount;
    data['product_data_create'] = this.productDataCreate;
    data['product_catogery'] = this.productCatogery;
    return data;
  }
}
