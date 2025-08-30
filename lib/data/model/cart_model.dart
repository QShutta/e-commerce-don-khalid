class CartModel {
  final int? totalPricePerProduct;
  final int? productCount;
  final int? cartId;
  final int? cartUserId;
  final int? cartProductId;
  final int? productsId;
  final String? productNameAr;
  final String? proudctNameEn;
  final String? productDescAr;
  final String? productDescEn;
  final String? productImage;
  final int? productActive;
  final int? productPriceOriginal;
  final int? productDiscount;
  final String? productDataCreate;
  final int? productCatogery;

  CartModel({
    this.totalPricePerProduct,
    this.productCount,
    this.cartId,
    this.cartUserId,
    this.cartProductId,
    this.productsId,
    this.productNameAr,
    this.proudctNameEn,
    this.productDescAr,
    this.productDescEn,
    this.productImage,
    this.productActive,
    this.productPriceOriginal,
    this.productDiscount,
    this.productDataCreate,
    this.productCatogery,
  });

  // This is a factory constructor to create a Dart object from a JSON map (for decoding data from an API)
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      totalPricePerProduct: json['total_price_per_product'] as int?,
      productCount: json['productCount'] as int?,
      cartId: json['cart_id'] as int?,
      cartUserId: json['cart_user_id'] as int?,
      cartProductId: json['cart_product_id'] as int?,
      productsId: json['products_id'] as int?,
      productNameAr: json['product_name_ar'] as String?,
      proudctNameEn: json['proudct_name_en'] as String?,
      productDescAr: json['product_desc_ar'] as String?,
      productDescEn: json['product_desc_en'] as String?,
      productImage: json['product_image'] as String?,
      productActive: json['product_active'] as int?,
      productPriceOriginal: json['product_price'] as int?,
      productDiscount: json['product_discount'] as int?,
      productDataCreate: json['product_data_create'] as String?,
      productCatogery: json['product_catogery'] as int?,
    );
  }

  // This method converts a Dart object back into a JSON map (for sending data to an API)
  Map<String, dynamic> toJson() {
    return {
      'total_price_per_product': totalPricePerProduct,
      'productCount': productCount,
      'cart_id': cartId,
      'cart_user_id': cartUserId,
      'cart_product_id': cartProductId,
      'products_id': productsId,
      'product_name_ar': productNameAr,
      'proudct_name_en': proudctNameEn,
      'product_desc_ar': productDescAr,
      'product_desc_en': productDescEn,
      'product_image': productImage,
      'product_count':
          productCount, // Notice this key exists twice in your original JSON, which is unusual
      'product_active': productActive,
      'product_price': productPriceOriginal,
      'product_discount': productDiscount,
      'product_data_create': productDataCreate,
      'product_catogery': productCatogery,
    };
  }
}
