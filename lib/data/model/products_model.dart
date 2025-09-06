class ProductsModel {
  int? productsId;
  String? productNameAr;
  String? proudctNameEn;
  String? productDescAr;
  String? productDescEn;
  String? productImage;
  int? productCount;
  int? productActive;
  int? productPrice;
  int? productDiscount;
  String? productDataCreate;
  int? productCatogery;
  String? fav;
  int? priceAfterDiscount;

  ProductsModel({
    this.productsId,
    this.fav,
    this.productNameAr,
    this.proudctNameEn,
    this.productDescAr,
    this.productDescEn,
    this.productImage,
    this.productCount,
    this.productActive,
    this.productPrice,
    this.productDiscount,
    this.productDataCreate,
    this.productCatogery,
    this.priceAfterDiscount,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];
    productNameAr = json['product_name_ar'];
    proudctNameEn = json['proudct_name_en'];
    productDescAr = json['product_desc_ar'];
    productDescEn = json['product_desc_en'];
    productImage = json['product_image'];
    productCount = json['product_count'];
    productActive = json['product_active'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productDataCreate = json['product_data_create'];
    productCatogery = json['product_catogery'];
    fav = json['fav'].toString();
    priceAfterDiscount = json['priceAfterDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['products_id'] = productsId;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['fav'] = fav;
    data['product_name_ar'] = productNameAr;
    data['proudct_name_en'] = proudctNameEn;
    data['product_desc_ar'] = productDescAr;
    data['product_desc_en'] = productDescEn;
    data['product_image'] = productImage;
    data['product_count'] = productCount;
    data['product_active'] = productActive;
    data['product_price'] = productPrice;
    data['product_discount'] = productDiscount;
    data['product_data_create'] = productDataCreate;
    data['product_catogery'] = productCatogery;
    data['fav'] = fav;
    return data;
  }
}
