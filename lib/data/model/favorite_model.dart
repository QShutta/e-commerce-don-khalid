class FavoriteModel {
  int? favoriteId;
  int? userId;
  int? productId;
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
  int? useridTableFromUsersTable;

  FavoriteModel({
    this.favoriteId,
    this.userId,
    this.productId,
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
    this.useridTableFromUsersTable,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    userId = json['user_id'];
    productId = json['product_id'];
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
    useridTableFromUsersTable = json['userid_table_from_users_table'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['products_id'] = productsId;
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
    data['userid_table_from_users_table'] = useridTableFromUsersTable;
    return data;
  }
}
