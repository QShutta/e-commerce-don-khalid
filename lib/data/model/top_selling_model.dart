class TopSellingModel {
  int? orderCount;
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
  double? productRating;

  TopSellingModel({
    this.orderCount,
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
    this.productRating,
  });

  TopSellingModel.fromJson(Map<String, dynamic> json) {
    orderCount = json['orderCount'];
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
    //we know that the value that came ot us is number wither it's int or double
    //but dart doesn't konw so we tell dart :hey dart this is a number by "as num".num is the parent father of all of the number in dart wither it's int,double
    //after dart know that this is a number we can convert it to double.
    productRating = (json["product_rating"] as num).toDouble();
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
    data['product_rating'] = productRating;
    return data;
  }
}
