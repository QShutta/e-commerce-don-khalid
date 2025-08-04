import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class FavData {
  Crud crud;
  FavData(this.crud);

  Future addToFavorite(userId, productId) async {
    var response = await crud.postData(AppLinkApi.addToFav, {
      "user_id": userId,
      "product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future deleteFromFavorite(userId, productId) async {
    var response = await crud.postData(AppLinkApi.deleteFav, {
      "user_id": userId,
      "product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
