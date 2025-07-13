class Products {
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

  Products({
    this.productsId,
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
  });

  Products.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products_id'] = this.productsId;
    data['product_name_ar'] = this.productNameAr;
    data['proudct_name_en'] = this.proudctNameEn;
    data['product_desc_ar'] = this.productDescAr;
    data['product_desc_en'] = this.productDescEn;
    data['product_image'] = this.productImage;
    data['product_count'] = this.productCount;
    data['product_active'] = this.productActive;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_data_create'] = this.productDataCreate;
    data['product_catogery'] = this.productCatogery;
    return data;
  }
}
